class AddDeployMethodIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :deploy_method_id, :bigint, null: false, after: :project_group_id
    add_foreign_key :projects, :deploy_methods, primary_key: :deploy_method_id, column: :deploy_method_id
  end
end
