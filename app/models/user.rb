class User < ApplicationRecord
  self.primary_key = :user_id

  has_secure_password
  before_create { self.id = Ulid.generate }

  has_many :users_permissions, primary_key: :user_permission_id, foreign_key: :user_permission_id
  has_many :permissions, through: :users_permissions, source: :permission
  has_many :subscriptions, primary_key: :user_id, foreign_key: :user_id
  has_many :plans, through: :subscriptions, source: :plan
  has_many :invoices, primary_key: :user_id, foreign_key: :user_id
  has_many :project_groups, primary_key: :user_id, foreign_key: :user_id
  has_many :projects, primary_key: :user_id, foreign_key: :user_id

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
