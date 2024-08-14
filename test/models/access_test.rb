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
require "test_helper"

class AccessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
