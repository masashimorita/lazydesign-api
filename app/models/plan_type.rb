class PlanType < ApplicationRecord
  self.primary_key = :plan_type_id
  before_destroy :deletable?

  has_many :plans, primary_key: :plan_type_id, foreign_key: :plan_type_id

  validates :plan_type_id, presence: true, uniqueness: { case_sensitive: true }, numericality: {only_integer: true }
  validates :plan_type_name, presence: true

  def deletable?
    unless self.plans.length == 0
      raise LazyDesign::ForbiddenError, "There are plans associated with this plan type"
    end
    true
  end
end
