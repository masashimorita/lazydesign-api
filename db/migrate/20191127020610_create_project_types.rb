class CreateProjectTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_types, primary_key: :project_type_id do |t|
      t.string  :project_type_name, null: false
    end
  end
end
