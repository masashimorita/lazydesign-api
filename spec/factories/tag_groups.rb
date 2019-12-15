FactoryBot.define do
  factory :tag_group do
    group_name { default_group_name }

    transient do
      default_group_name { "Sample Group" }
    end
  end
end
