class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions, id: false do |t|
      t.column :subscription_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :user_id, "VARBINARY(128)", null: false
      t.column :plan_id, "VARBINARY(128)", null: false
      t.string :stripe_subscription_id, null: false
      t.datetime :active_until, null: false

      t.timestamps
    end
    add_foreign_key :subscriptions, :users, primary_key: :user_id, column: :user_id
    add_foreign_key :subscriptions, :plans, primary_key: :plan_id, column: :plan_id
  end
end
