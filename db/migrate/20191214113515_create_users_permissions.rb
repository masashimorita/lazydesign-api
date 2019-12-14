class CreateUsersPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :users_permissions, id: false do |t|
      t.column :user_plan_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :permission_id, "BIGINT", null: false
      t.column :user_id, "VARBINARY(128)", null: false

      t.timestamps
    end
  end
end
