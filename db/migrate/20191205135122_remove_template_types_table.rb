class RemoveTemplateTypesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :template_types
  end
end
