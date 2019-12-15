class Page < ApplicationRecord
  self.primary_key = :page_id
  before_create { self.id = Ulid.generate }

  belongs_to :container, polymorphic: true
  has_many :file_contents, primary_key: :page_id, foreign_key: :page_id

  validates :page_name, presence: true
end
