class ProjectGroup < ApplicationRecord
  self.primary_key = :project_group_id
  before_create { self.id = Ulid.generate }

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id

  validates :project_group_name, presence: true
end
