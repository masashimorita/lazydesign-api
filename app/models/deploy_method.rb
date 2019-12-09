class DeployMethod < ApplicationRecord
  self.primary_key = :deploy_method_id

  validates :deploy_method_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates_presence_of :deploy_method_name, :deploy_program, :entry_point
end
