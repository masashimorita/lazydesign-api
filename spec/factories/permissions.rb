FactoryBot.define do
  factory :permission do
    sequence(:permission_id) { |i| default_permission_id || i }
    permission_description { default_permission_description }
    permitted_target { default_permitted_target }
    permitted_operation { default_permitted_operation }

    transient do
      default_permission_id { nil }
      default_permission_description { "Sample Description" }
      default_permitted_target { "SampleClass" }
      default_permitted_operation { :do_something }
    end
  end
end
