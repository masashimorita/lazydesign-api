class CreateTemplateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :template_parts, id: false do |t|
      t.column :template_part_id, "BIGINT PRIMARY KEY", null: false
      t.string :part_name, null: false
      t.text :part_description
      t.string :part_thumbnail
      t.text :content_markup, null: false
      t.text :content_style

      t.timestamps
    end
  end
end
