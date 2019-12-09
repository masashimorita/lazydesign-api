class CreateTemplateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :template_infos, id: false do |t|
      t.column :template_info_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :template_id, "VARBINARY(128)", null: false
      t.column :template_part_id, "VARBINARY(128)", null: false

      t.timestamps
    end
    add_foreign_key :template_infos, :templates, primary_key: :template_id, column: :template_id
    add_foreign_key :template_infos, :template_parts, primary_key: :template_part_id, column: :template_part_id
  end
end
