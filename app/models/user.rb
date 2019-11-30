class User < ApplicationRecord
  has_secure_password
  before_create { self.id = Ulid.generate }

  validates :name, presence: true
  validates :email, presence: true
end
