class TemplateInfo < ApplicationRecord
  self.primary_key = :template_info_id
  before_create { self.id = Ulid.generate }

  belongs_to :template, primary_key: :template_id, foreign_key: :template_id
  belongs_to :template_part, primary_key: :template_part_id, foreign_key: :template_part_id
end
