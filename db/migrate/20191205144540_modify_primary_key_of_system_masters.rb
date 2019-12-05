class ModifyPrimaryKeyOfSystemMasters < ActiveRecord::Migration[6.0]
  def change
    remove_column :configuration_types, :id, :integer, :primary_key
    add_column :configuration_types, :configuration_type_id, "BIGINT PRIMARY KEY", null: false, :first => true

    remove_column :deploy_methods, :id, :integer, :primary_key
    add_column :deploy_methods, :deploy_method_id, "BIGINT PRIMARY KEY", null: false, :first => true

    remove_column :file_types, :id, :integer, :primary_key
    add_column :file_types, :file_type_id, "BIGINT PRIMARY KEY", null: false, :first => true

    remove_column :users, :id, "VARBINARY(128)", :primary_key
    add_column :users, :user_id, "VARBINARY(128) PRIMARY KEY", null: false, :first => true
  end
end
