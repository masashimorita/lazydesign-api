class PlanType < ApplicationRecord
  self.primary_key = :plan_type_id

  has_many :plans, primary_key: :plan_type_id, foreign_key: :plan_type_id

  validates :plan_type_id, presence: true, uniqueness: true, numericality: {only_integer: true }
  validates :plan_type_name, presence: true
end
