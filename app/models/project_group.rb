class ProjectGroup < ApplicationRecord
  self.primary_key = :project_group_id
  include GenerateUlid
  before_destroy :deletable?

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  has_many :projects, primary_key: :project_group_id, foreign_key: :project_group_id

  validates :project_group_name, presence: true

  def deletable?
    unless self.projects.length == 0
      raise LazyDesign::ForbiddenError, 'There are projects associated with this project group'
    end
    true
  end
end
