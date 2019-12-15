FactoryBot.define do
  factory :permission do
    sequence(:permission_id) { |i| default_permission_id || i }
    permission_code { default_permission_cocde }
    permission_description { default_permission_description }

    transient do
      default_permission_id { nil }
      default_permission_cocde { :read }
      default_permission_description { "Sample Description" }
    end
  end
end
