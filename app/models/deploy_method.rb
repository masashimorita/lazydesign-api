class DeployMethod < ApplicationRecord
  self.primary_key = :deploy_method_id

  validates :deploy_method_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :deploy_method_name, presence: true
end
