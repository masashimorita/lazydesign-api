class Admin < ApplicationRecord
  self.primary_key = :admin_id
  attribute :token, :string

  has_secure_password
  include GenerateUlid

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :is_super_admin, allow_blank: true, inclusion: [true, false]

  def self.from_token_payload(payload)
    payload["admin_id"] ? self.find(payload["admin_id"]) : nil
  end

  def to_token_payload
    { admin_id: self.id }
  end
end
