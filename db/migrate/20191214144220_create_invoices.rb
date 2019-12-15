class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices, id: false do |t|
      t.column :invoice_id, "VARBINARY(128) PRIMARY KEY", null: false
      t.column :user_id, "VARBINARY(128)", null: false
      t.string :stripe_customer_id, null: false
      t.string :stripe_invoice_id, null: false
      t.string :stripe_charge_id, null: false
      t.boolean :closed, default: false
      t.string :currency, null: false
      t.datetime :payment_processed_at
      t.datetime :next_payment_attemp
      t.boolean :paid, default: false
      t.decimal :subtotal, null: false, precision: 8, scale: 2
      t.decimal :tax, null: false, precision: 8, scale: 2
      t.integer :tax_percent, null: false
      t.decimal :total, null: false, precision: 8, scale: 2
      t.datetime :subscription_period_started_at
      t.datetime :subscription_period_ended_at
      t.decimal :starting_balance, precision: 10, scale: 2
      t.decimal :ending_balance, precision: 10, scale: 2

      t.timestamps
    end
    add_foreign_key :invoices, :users, primary_key: :user_id, column: :user_id
  end
end
