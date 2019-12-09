class TagGroup < ApplicationRecord
  self.primary_key = :tag_group_id
  before_create { self.id = Ulid.generate }

  has_many :tags, primary_key: :tag_group_id, foreign_key: :tag_group_id

  validates_presence_of :group_name
end
