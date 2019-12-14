class Permission < ApplicationRecord
  self.primary_key = :permission_id

  has_many :users_permissions, primary_key: :user_permission_id, foreign_key: :user_permission_id
  has_many :users, through: :users_permissions, source: :user
  has_many :plans_permissions, primary_key: :plan_id, foreign_key: :plan_id
  has_many :plans, through: :plans_permissions, source: :plan

  validates :permission_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates_presence_of :permission_code, :permission_description
end
