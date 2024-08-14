class AddRoleAndPermissionToAccesses < ActiveRecord::Migration[7.1]
  def change
    add_reference :accesses, :permission, null: false, foreign_key: true
    add_reference :accesses, :role, null: false, foreign_key: true
  end
end
