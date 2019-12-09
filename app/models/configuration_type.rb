class ConfigurationType < ApplicationRecord
  self.primary_key = :configuration_type_id

  validates :configuration_type_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :configuration_type_name, presence: true
end
