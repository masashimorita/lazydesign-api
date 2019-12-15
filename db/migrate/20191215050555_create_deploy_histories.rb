class CreateDeployHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :deploy_histories, id: false do |t|
      t.column :deploy_history_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :deploy_method_id, "BIGINT", null: false
      t.column :project_id, "VARBINARY(128)", null: false
      t.datetime :deployed_at, null: false

      t.timestamps
    end
    add_foreign_key :deploy_histories, :deploy_methods, primary_key: :deploy_method_id, column: :deploy_method_id
    add_foreign_key :deploy_histories, :projects, primary_key: :project_id, column: :project_id
  end
end
