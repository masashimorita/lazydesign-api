FactoryBot.define do
  factory :page do
    container { default_container }
    page_name { default_page_name }
    is_initial_page { default_is_initial_page }

    transient do
      default_container { create(:template) }
      default_page_name { "Sample Page" }
      default_is_initial_page { false }
    end
  end
end
