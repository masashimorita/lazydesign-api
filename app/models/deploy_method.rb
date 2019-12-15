class DeployMethod < ApplicationRecord
  self.primary_key = :deploy_method_id
  before_destroy :deletable?

  has_many :deploy_histories, primary_key: :deploy_method_id, foreign_key: :deploy_method_id
  has_many :projects, primary_key: :deploy_method_id, foreign_key: :deploy_method_id

  validates :deploy_method_id, presence: true, uniqueness: { case_sensitive: true }, numericality: { only_integer: true }
  validates_presence_of :deploy_method_name, :deploy_program, :entry_point

  def deletable?
    unless self.projects.length == 0
      raise LazyDesign::ForbiddenError, "There are projects associated with this deploy method"
    end
    true
  end
end
