class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages, id: false do |t|
      t.column :page_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.string :container_type, null: false
      t.column :container_id, "VARBINARY(128)", null: false
      t.string :page_name, null: false
      t.boolean :is_initial_page, default: false

      t.timestamps
    end
    add_index :pages, [:container_type, :container_id]
  end
end
