class PlansPermission < ApplicationRecord
  self.primary_key = :plan_permission_id
  include GenerateUlid

  belongs_to :permission, primary_key: :permission_id, foreign_key: :permission_id
  belongs_to :plan, primary_key: :plan_id, foreign_key: :plan_id
end
