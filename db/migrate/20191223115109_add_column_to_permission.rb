class AddColumnToPermission < ActiveRecord::Migration[6.0]
  def change
    rename_column :permissions, :permission_code, :permitted_target
    change_column :permissions, :permission_description, :text, null: true
    add_column :permissions, :permitted_operation, :string, null: false
  end
end
