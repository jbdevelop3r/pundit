# == Schema Information
#
# Table name: permissions
#
#  id         :bigint           not null, primary key
#  name       :string
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Permission < ApplicationRecord

  DEFAULT_CATEGORY = %w[Create Read Update Delete Show].freeze

  has_many :accesses, dependent: :destroy
  # has_many :roles, through: :accesses

  validates :name, presence: true, uniqueness: { scope: :action, case_sensitive: false }

  normalizes :action, with: ->(value) { value.strip.titleize }

  after_create :create_accesses

  private

  def create_accesses
    Role.find_each do |role|
      Access.create(role:, permission: self)
    end
  end
end
