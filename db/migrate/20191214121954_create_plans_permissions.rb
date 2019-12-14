class CreatePlansPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :plans_permissions, id: false do |t|
      t.column :plan_permission_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :permission_id, "BIGINT", null: false
      t.column :plan_id, "VARBINARY(128)", null: false

      t.timestamps
    end
    add_foreign_key :plans_permissions, :permissions, primary_key: :permission_id, column: :permission_id
    add_foreign_key :plans_permissions, :plans, primary_key: :plan_id, column: :plan_id
  end
end
