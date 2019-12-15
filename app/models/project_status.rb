class ProjectStatus < ApplicationRecord
  self.primary_key = :project_status_id
  before_destroy :deletable?

  has_many :projects, primary_key: :project_status_id, foreign_key: :project_status_id

  validates :project_status_id, presence: true, uniqueness: { case_sensitive: true }, numericality: { only_integer: true }
  validates :project_status_name, presence: true

  def deletable?
    unless self.projects.length == 0
      raise LazyDesign::ForbiddenError, "There are projects associated with this project status"
    end
    true
  end
end
