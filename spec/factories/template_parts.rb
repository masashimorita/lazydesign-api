FactoryBot.define do
  factory :template_part do
    part_name { default_part_name }
    part_description { default_part_description }
    part_thumbnail { default_part_thumbnail }
    content_markup { default_content_markup }
    content_style { default_content_style }

    transient do
      default_part_name { "Sample Part" }
      default_part_description { "" }
      default_part_thumbnail { nil }
      default_content_markup { "<div class='test'>This is a sample template</div>" }
      default_content_style { ".test { background-color: red; }" }
    end
  end
end
