FactoryBot.define do
  factory :plan_type do
    sequence(:plan_type_id) { |i| default_plan_type_id || i }
    plan_type_name { default_plan_type_name }

    transient do
      default_plan_type_id { nil }
      default_plan_type_name { "Sample Plan" }
    end
  end
end
