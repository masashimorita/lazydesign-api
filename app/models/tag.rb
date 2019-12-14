class Tag < ApplicationRecord
  self.primary_key = :tag_id
  before_create { self.id = Ulid.generate }

  belongs_to :tag_group, primary_key: :tag_group_id, foreign_key: :tag_group_id
  has_many :templates_tags, primary_key: :template_id, foreign_key: :template_id
  has_many :templates, through: :templates_tags, source: :template

  validates :tag_name, presence: true
end
