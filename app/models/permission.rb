class Permission < ApplicationRecord
  self.primary_key = :permission_id

  validates :permission_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates_presence_of :permission_code, :permission_description
end
