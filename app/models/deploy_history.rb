class DeployHistory < ApplicationRecord
  self.primary_key = :deploy_history_id
  before_create { self.id = Ulid.generate }

  belongs_to :deploy_method, primary_key: :deploy_method_id, foreign_key: :deploy_method_id
  belongs_to :project, primary_key: :project_id, foreign_key: :project_id

  validates :deployed_at, presence: true
end
