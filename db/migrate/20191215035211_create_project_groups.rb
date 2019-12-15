class CreateProjectGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :project_groups, id: false do |t|
      t.column :project_group_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :user_id, "VARBINARY(128)", null: false
      t.string :project_group_name, null: false

      t.timestamps
    end
    add_foreign_key :project_groups, :users, primary_key: :user_id, column: :user_id
  end
end
