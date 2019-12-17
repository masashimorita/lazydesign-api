FactoryBot.define do
  factory :admin do
    name { default_name }
    sequence(:email) { |i| default_email || "lazydesign#{i}@admin.com"  }
    password { default_password }
    is_super_admin { default_is_super_admin }

    transient do
      default_name { "Sample Admin" }
      default_email { nil }
      default_password { "password" }
      default_is_super_admin { false }
    end
  end
end
