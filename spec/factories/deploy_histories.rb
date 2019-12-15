FactoryBot.define do
  factory :deploy_history do
    deploy_method { default_deploy_method }
    project { default_project }
    deployed_at { default_deployed_at }
    
    transient do
      default_deploy_method { create(:deploy_method) }
      default_project { create(:project) }
      default_deployed_at { Time.current }
    end
  end
end
