class TagGroup < ApplicationRecord
  self.primary_key = :tag_group_id
  before_create { self.id = Ulid.generate }

  validates_presence_of :group_name
end
