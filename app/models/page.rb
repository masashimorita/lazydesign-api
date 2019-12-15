class Page < ApplicationRecord
  self.primary_key = :page_id
  before_create { self.id = Ulid.generate }

  belongs_to :container, polymorphic: true

  validates :page_name, presence: true
end
