class CreateProductTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_types, id: false do |t|
      t.column :product_id, "BIGINT PRIMARY KEY", null: false
      t.string :product_type_name, null: false
    end
  end
end
