FactoryBot.define do
  factory :configuration do
    configurator { default_configurator }
    configuration_key { default_configuration_key }
    configuration_value { default_configuration_value }

    transient do
      default_configurator { create(:template) }
      default_configuration_key { "Sample Configuration" }
      default_configuration_value { "Sample Value" }
    end
  end
end
