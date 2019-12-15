require "concerns/generate_ulid"

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
