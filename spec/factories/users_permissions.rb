FactoryBot.define do
  factory :users_permission do
    permission { default_permission }
    user { default_user }

    transient do
      default_permission { create(:permission) }
      default_user { create(:user) }
    end
  end
end
