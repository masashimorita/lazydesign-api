class TagGroup < ApplicationRecord
  self.primary_key = :tag_group_id
  include GenerateUlid
  before_destroy :deletable?

  has_many :tags, primary_key: :tag_group_id, foreign_key: :tag_group_id

  validates_presence_of :group_name

  def deletable?
    unless self.tags.length == 0
      raise LazyDesign::ForbiddenError, "There are tags associated with tag group"
    end
    true
  end
end
