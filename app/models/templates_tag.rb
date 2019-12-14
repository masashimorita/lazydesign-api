class TemplatesTag < ApplicationRecord
  self.primary_key = :template_tag_id
  before_create { self.id = Ulid.generate }

  belongs_to :template, primary_key: :template_id, foreign_key: :template_id
  belongs_to :tag, primary_key: :tag_id, foreign_key: :tag_id
end
