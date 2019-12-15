class FileType < ApplicationRecord
  self.primary_key = :file_type_id

  has_many :file_contents, primary_key: :file_type_id, foreign_key: :file_type_id

  validates :file_type_id, presence: true, uniqueness: { case_sensitive: true }, numericality: { only_integer: true }
  validates_presence_of :file_type_name, :file_extension
end
