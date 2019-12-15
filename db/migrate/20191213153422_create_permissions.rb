class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions, id: false do |t|
      t.column :permission_id, "BIGINT PRIMARY KEY", null: false
      t.string :permission_code, null: false
      t.text :permission_description, null: false
    end
  end
end
