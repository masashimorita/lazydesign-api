FactoryBot.define do
  factory :templates_tag do
    template { default_template }
    tag { default_tag }

    transient do
      default_template { create(:template) }
      default_tag { create(:tag) }
    end
  end
end
