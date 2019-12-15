FactoryBot.define do
  factory :project do
    product_type { default_product_type }
    template { default_template }
    user { default_user }
    project_status { default_project_status }
    project_group { default_project_group }
    project_name { default_project_name }
    thumbnail { default_thumbnail }
    is_on_trial { default_trial_ended_at }
    trial_ended_at { default_trial_ended_at }
    
    transient do
      default_product_type { create(:product_type) }
      default_template { create(:template) }
      default_user { create(:user) }
      default_project_status { create(:project_status) }
      default_project_group { create(:project_group) }
      default_project_name { "Sample Project" }
      default_thumbnail { nil }
      default_is_on_trial { false }
      default_trial_ended_at { nil }
    end
  end
end
