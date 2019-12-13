FactoryBot.define do
  factory :project_status do
    sequence(:project_status_id) { |i| default_project_status_id || i }
    project_status_name { default_project_status_name }

    transient do
      default_project_status_id { nil }
      default_project_status_name { "SAMPLE" }
    end
  end
end
