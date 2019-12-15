class Subscription < ApplicationRecord
  self.primary_key = :subscription_id
  include GenerateUlid

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  belongs_to :plan, primary_key: :plan_id, foreign_key: :plan_id

  validates :stripe_subscription_id, presence: true
  validates :active_until, presence: true
end
