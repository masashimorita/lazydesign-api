FactoryBot.define do
  factory :file_type do
    sequence(:file_type_id) { |i| default_file_type_id || i }
    file_type_name          { default_file_type_name }
    file_extension          { default_file_extension }

    transient do
      default_file_type_id { nil }
      default_file_type_name { "CSS" }
      default_file_extension { "css" }
    end
  end
end
