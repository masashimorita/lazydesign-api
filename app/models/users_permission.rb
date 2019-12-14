class UsersPermission < ApplicationRecord
  self.primary_key = :user_permission_id
  before_create { self.id = Ulid.generate }

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  belongs_to :permission, primary_key: :permission_id, foreign_key: :permission_id
end
