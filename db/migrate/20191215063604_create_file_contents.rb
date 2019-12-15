class CreateFileContents < ActiveRecord::Migration[6.0]
  def change
    create_table :file_contents, id: false do |t|
      t.column :file_content_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :file_type_id, "BIGINT", null: false
      t.column :page_id, "VARBINARY(128)", null: false
      t.string :content, null: false

      t.timestamps
    end
    add_foreign_key :file_contents, :file_types, primary_key: :file_type_id, column: :file_type_id
    add_foreign_key :file_contents, :pages, primary_key: :page_id, column: :page_id
  end
end
