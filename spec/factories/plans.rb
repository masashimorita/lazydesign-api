FactoryBot.define do
  factory :plan do
    plan_type { default_plan_type }
    stripe_plan_id { default_stripe_plan_id }
    plan_name { default_plan_name }
    amount { default_amount }
    currency { default_currency }
    interval { default_interval }
    statement_descriptor { default_statement_descriptor }

    transient do
      default_plan_type { create(:plan_type) }
      default_stripe_plan_id { "3833030" }
      default_plan_name { "Sample Plan" }
      default_amount { 100 }
      default_currency { "JPN" }
      default_interval { 30 }
      default_statement_descriptor { nil }
    end
  end
end
