class TemplateInfo < ApplicationRecord
  self.primary_key = :template_info_id
  include GenerateUlid

  belongs_to :template, primary_key: :template_id, foreign_key: :template_id
  belongs_to :template_part, primary_key: :template_part_id, foreign_key: :template_part_id
end
