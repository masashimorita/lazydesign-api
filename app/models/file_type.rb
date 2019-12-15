class FileType < ApplicationRecord
  self.primary_key = :file_type_id
  before_destroy :deletable?

  has_many :file_contents, primary_key: :file_type_id, foreign_key: :file_type_id

  validates :file_type_id, presence: true, uniqueness: { case_sensitive: true }, numericality: { only_integer: true }
  validates_presence_of :file_type_name, :file_extension

  def deletable?
    unless self.file_contents.length == 0
      raise LazyDesign::ForbiddenError, "There are file contents associated with this file type"
    end
    true
  end
end
