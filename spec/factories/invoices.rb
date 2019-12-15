FactoryBot.define do
  factory :invoice do
    user { default_user }
    stripe_customer_id { default_stripe_customer_id }
    stripe_invoice_id { default_stripe_invoice_id }
    stripe_charge_id { default_stripe_charge_id }
    closed { default_closed }
    currency { default_currency }
    payment_processed_at { default_payment_processed_at }
    next_payment_attemp { default_next_payment_attemp }
    paid { default_paid }
    subtotal { default_subtotal }
    tax { default_tax }
    tax_percent { default_tax_percent }
    total { default_total }
    subscription_period_started_at { default_subscription_period_started_at }
    subscription_period_ended_at { default_subscription_period_ended_at }
    starting_balance { default_starting_balance }
    ending_balance { default_ending_balance }

    transient do
      default_user { create(:user) }
      default_stripe_customer_id { "333o3o3o" }
      default_stripe_invoice_id { "3o3933300" }
      default_stripe_charge_id { "202910" }
      default_closed { false }
      default_currency { "JPN" }
      default_payment_processed_at { Time.current }
      default_next_payment_attemp { Time.current + 3.days }
      default_paid { false }
      default_subtotal { 100.12 }
      default_tax { 10.12 }
      default_tax_percent { 10 }
      default_total { 110.24 }
      default_subscription_period_started_at { Time.current }
      default_subscription_period_ended_at { Time.current + 30.days }
      default_starting_balance { 200.22 }
      default_ending_balance { 90.02 }
    end
  end
end
