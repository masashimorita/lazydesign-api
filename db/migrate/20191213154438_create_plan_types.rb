class CreatePlanTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_types, id: false do |t|
      t.column :plan_type_id, "BIGINT PRIMARY KEY", null: false
      t.string :plan_type_name
    end
  end
end
