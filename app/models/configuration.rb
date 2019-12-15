class Configuration < ApplicationRecord
  self.primary_key = :configuration_id
  before_create { self.id = Ulid.generate }

  belongs_to :configurator, polymorphic: true

  validates_presence_of :configuration_key, :configuration_value
end
