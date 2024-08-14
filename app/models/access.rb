# == Schema Information
#
# Table name: accesses
#
#  id            :bigint           not null, primary key
#  is_allowed    :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  permission_id :bigint           not null
#  role_id       :bigint           not null
#
class Access < ApplicationRecord
  belongs_to :role
  belongs_to :permission

  scope :with_permission, lambda { |name:, action:, is_allowed:|
    joins(:permission).where(permissions: { name:, action: }).where(is_allowed:)
  }

end
