FactoryBot.define do
  factory :tag do
    tag_group { default_tag_group }
    tag_name { default_tag_name }

    transient do
      default_tag_group { create(:tag_group) }
      default_tag_name { "Sample Tag" }
    end
  end
end
