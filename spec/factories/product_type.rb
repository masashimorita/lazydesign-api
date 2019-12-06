FactoryBot.define do
  factory :product_type do
    sequence(:product_type_id) { |i| default_product_type_id || i }
    product_type_name          { default_product_type_name }

    transient do
      default_product_type_id { nil }
      default_product_type_name { "Sample Product Type" }
    end
  end
end
