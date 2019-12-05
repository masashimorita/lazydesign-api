class RemoveProjectTypesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :project_types
  end
end
