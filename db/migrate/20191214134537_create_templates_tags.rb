class CreateTemplatesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :templates_tags, id: false do |t|
      t.column :template_tag_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :template_id, "VARBINARY(128)", null: false
      t.column :tag_id, "VARBINARY(128)", null: false

      t.timestamps
    end
    add_foreign_key :templates_tags, :templates, primary_key: :template_id, column: :template_id
    add_foreign_key :templates_tags, :tags, primary_key: :tag_id, column: :tag_id
  end
end
