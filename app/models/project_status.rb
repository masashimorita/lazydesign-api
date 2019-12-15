class ProjectStatus < ApplicationRecord
  self.primary_key = :project_status_id

  has_many :projects, primary_key: :project_status_id, foreign_key: :project_status_id

  validates :project_status_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :project_status_name, presence: true
end
