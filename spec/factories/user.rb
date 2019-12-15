FactoryBot.define do
  factory :user do
    sequence(:email) { |i| default_email || "LazyDesign#{i}@example.com" }
    name             { default_name }
    password         { default_password }
    stripe_customer_id { default_stripe_customer_id }
    stripe_card_id { default_stripe_card_id }
    image { default_image }
    tutorial_completed { default_tutorial_completed }

    transient do
      default_email { nil }
      default_name { "LazyDesign Tester" }
      default_password { "Sample" }
      default_stripe_customer_id { nil }
      default_stripe_card_id { nil }
      default_image { nil }
      default_tutorial_completed { false }
    end
  end
end
