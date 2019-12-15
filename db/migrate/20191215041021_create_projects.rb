class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects, id: false do |t|
      t.column :project_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :product_type_id, "BIGINT", null: false
      t.column :template_id, "VARBINARY(128)", null: false
      t.column :user_id, "VARBINARY(128)", null: false
      t.column :project_status_id, "BIGINT", null: false
      t.column :project_group_id, "VARBINARY(128)", null: false
      t.string :project_name, null: false
      t.string :thumbnail
      t.boolean :is_on_trial, default: false
      t.datetime :trial_ended_at

      t.timestamps
    end
    add_foreign_key :projects, :product_types, primary_key: :product_type_id, column: :product_type_id
    add_foreign_key :projects, :templates, primary_key: :template_id, column: :template_id
    add_foreign_key :projects, :users, primary_key: :user_id, column: :user_id
    add_foreign_key :projects, :project_statuses, primary_key: :project_status_id, column: :project_status_id
    add_foreign_key :projects, :project_groups, primary_key: :project_group_id, column: :project_group_id
  end
end
