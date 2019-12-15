class TemplatePart < ApplicationRecord
  self.primary_key = :template_part_id
  include GenerateUlid

  has_many :template_infos, primary_key: :template_part_id, foreign_key: :template_part_id, dependent: :destroy
  has_many :templates, through: :template_infos, source: :template

  validates_presence_of :part_name, :content_markup
end
