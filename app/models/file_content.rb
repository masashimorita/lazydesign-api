class FileContent < ApplicationRecord
  self.primary_key = :file_content_id
  include GenerateUlid

  belongs_to :file_type, primary_key: :file_type_id, foreign_key: :file_type_id
  belongs_to :page, primary_key: :page_id, foreign_key: :page_id

  validates :content, presence: true
  validates :content, presence: true
end
