class User < ApplicationRecord
  self.primary_key = :user_id

  has_secure_password
  include GenerateUlid

  mount_uploader :image, UserUploader

  has_many :users_permissions, primary_key: :user_permission_id, foreign_key: :user_permission_id, dependent: :destroy
  has_many :permissions, through: :users_permissions, source: :permission
  has_many :subscriptions, primary_key: :user_id, foreign_key: :user_id, dependent: :destroy
  has_many :plans, through: :subscriptions, source: :plan
  has_many :invoices, primary_key: :user_id, foreign_key: :user_id, dependent: :destroy
  has_many :project_groups, primary_key: :user_id, foreign_key: :user_id, dependent: :destroy
  has_many :projects, primary_key: :user_id, foreign_key: :user_id, dependent: :destroy
  has_many :domains, primary_key: :user_id, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :tutorial_completed, allow_blank: true, inclusion: [true, false]

  def self.from_token_payload(payload)
    payload["user_id"] ? self.find(payload["user_id"]) : nil
  end

  def to_token_payload
    { user_id: self.id }
  end
end
