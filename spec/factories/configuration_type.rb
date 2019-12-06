FactoryBot.define do
  factory :configuration_type do
    sequence(:configuration_type_id) { |i| default_configuration_type_id || i }
    configuration_type_name          { default_configuration_type_name }

    transient do
      default_configuration_type_id { nil }
      default_configuration_type_name { "Sample Configuration Type" }
    end
  end
end
