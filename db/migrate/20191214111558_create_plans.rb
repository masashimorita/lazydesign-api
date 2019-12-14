class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans, id: false do |t|
      t.column :plan_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :plan_type_id, "BIGINT", null: false
      t.string :stripe_plan_id, null: false
      t.string :plan_name, null: false
      t.integer :amount, null: false
      t.string :currency, null: false
      t.integer :interval, null: false
      t.string :statement_descriptor

      t.timestamps
    end
  end
end
