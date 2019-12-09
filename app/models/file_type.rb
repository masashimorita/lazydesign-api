class FileType < ApplicationRecord
  self.primary_key = :file_type_id

  validates :file_type_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates_presence_of :file_type_name, :file_extension
end
