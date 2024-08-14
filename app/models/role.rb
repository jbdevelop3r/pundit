# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :accesses, dependent: :destroy
  has_many :users
  has_many :permissions, through: :accesses

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :name, with: ->(name) { name.strip.titleize }

  after_create :create_accesses

  def create_accesses
    Permission.find_each do |permission|
      accesses.create(permission:, role: self)
    end
  end
end

 