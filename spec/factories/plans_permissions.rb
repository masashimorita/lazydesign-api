FactoryBot.define do
  factory :plans_permission do
    permission { default_permission }
    plan { default_plan }

    transient do
      default_permission { create(:permission) }
      default_plan { create(:plan) }
    end
  end
end
