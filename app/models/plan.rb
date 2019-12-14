class Plan < ApplicationRecord
  self.primary_key = :plan_id
  before_create { self.id = Ulid.generate }

  belongs_to :plan_type, primary_key: :plan_type_id, foreign_key: :plan_type_id

  validates :stripe_plan_id, presence: true
  validates :plan_name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :currency, presence: true
  validates :interval, presence: true, numericality: { only_integer: true }
end
