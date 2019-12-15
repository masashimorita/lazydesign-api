class UsersPermission < ApplicationRecord
  self.primary_key = :user_permission_id
  include GenerateUlid

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  belongs_to :permission, primary_key: :permission_id, foreign_key: :permission_id
end
