FactoryBot.define do
  factory :domain do
    user { default_user }
    project { default_project }
    domain_name { default_domain_name }
    
    transient do
      default_user { create(:user) }
      default_project { create(:project) }
      default_domain_name { "sample.lazydesign.api" }
    end
  end
end
