class CreateProjectStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :project_statuses, id: false do |t|
      t.column :project_status_id, "BIGINT PRIMARY KEY", null: false
      t.string :project_status_name, null: false
    end
  end
end
