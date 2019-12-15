FactoryBot.define do
  factory :subscription do
    user { default_user }
    plan { default_plan }
    stripe_subscription_id { default_stripe_subscription_id }
    active_until { default_active_until }

    transient do
      default_user { create(:user) }
      default_plan { create(:plan) }
      default_stripe_subscription_id { "303920202" }
      default_active_until { Time.current + 30.days }
    end
  end
end
