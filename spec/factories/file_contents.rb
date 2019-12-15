FactoryBot.define do
  factory :file_content do
    file_type { default_file_type }
    page { default_page }
    content { default_content }
    
    transient do
      default_file_type { create(:file_type) }
      default_page { create(:page) }
      default_content { "Sample path" }
    end
  end
end
