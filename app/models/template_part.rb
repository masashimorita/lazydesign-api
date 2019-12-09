class TemplatePart < ApplicationRecord
  self.primary_key = :template_part_id

  validates_presence_of :part_name, :content_markup
end
