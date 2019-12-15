FactoryBot.define do
  factory :template_info do
    template { default_template }
    template_part { default_template_part }

    transient do
      default_template { create(:template) }
      default_template_part { create(:template_part) }
    end
  end
end
