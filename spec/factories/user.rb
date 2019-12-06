FactoryBot.define do
  factory :user do
    sequence(:email) { |i| default_email || "LazyDesign#{i}@example.com" }
    name             { default_name }
    password         { default_password }

    transient do
      default_email { nil }
      default_name { "LazyDesign Tester" }
      default_password { "Sample" }
    end
  end
end
