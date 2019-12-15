class Domain < ApplicationRecord
  self.primary_key = :domain_id
  before_create { self.id = Ulid.generate }

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id
  belongs_to :project, primary_key: :project_id, foreign_key: :project_id

  validates :domain_name, presence: true, uniqueness: true
end
