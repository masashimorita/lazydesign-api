class TemplatePart < ApplicationRecord
  self.primary_key = :template_part_id
  before_create { self.id = Ulid.generate }

  has_many :template_infos, primary_key: :template_part_id, foreign_key: :template_part_id
  has_many :templates, through: :template_infos, source: :template

  validates_presence_of :part_name, :content_markup
end
