class Page < ApplicationRecord
  self.primary_key = :page_id
  include GenerateUlid

  belongs_to :container, polymorphic: true
  has_many :file_contents, primary_key: :page_id, foreign_key: :page_id, dependent: :destroy

  validates :page_name, presence: true
end
