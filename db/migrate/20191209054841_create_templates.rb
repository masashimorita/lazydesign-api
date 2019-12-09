class CreateTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :templates, id: false do |t|
      t.column :template_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :product_type_id, "BIGINT", null: false
      t.string :template_name, null: false
      t.text :template_description
      t.string :template_thumbnail

      t.timestamps
    end
    add_foreign_key :templates, :product_types, column: :product_type_id, primary_key: :product_type_id
  end
end
