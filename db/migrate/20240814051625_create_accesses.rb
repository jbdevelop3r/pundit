class CreateAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :accesses do |t|
      t.boolean :is_allowed

      t.timestamps
    end
  end
end
