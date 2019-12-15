FactoryBot.define do
  factory :project_group do
    user { default_user }
    project_group_name { default_project_group_name }

    transient do
      default_user { create(:user) }
      default_project_group_name { "Sample Project Group" }
    end
  end
end
