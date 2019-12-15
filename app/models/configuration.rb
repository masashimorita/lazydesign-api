class Configuration < ApplicationRecord
  self.primary_key = :configuration_id
  include GenerateUlid

  belongs_to :configurator, polymorphic: true

  validates_presence_of :configuration_key, :configuration_value
end
