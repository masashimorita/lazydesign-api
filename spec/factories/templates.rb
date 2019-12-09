FactoryBot.define do
  factory :template do
    template_name { default_template_name }
    template_description { default_description }
    template_thumbnail { default_thumbnail }

    product_type { default_product_type }

    transient do
      default_template_name { "Template Name" }
      default_description { "" }
      default_thumbnail { nil }
      default_product_type { create(:product_type) }
    end
  end
end
