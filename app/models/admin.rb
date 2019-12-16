class Admin < ApplicationRecord
  self.primary_key = :admin_id
  has_secure_password
  include GenerateUlid

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :is_super_admin, allow_blank: true, inclusion: [true, false]
end
