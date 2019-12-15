class Template < ApplicationRecord
  self.primary_key = :template_id
  before_create { self.id = Ulid.generate }

  has_many :projects, primary_key: :template_id, foreign_key: :template_id
  has_many :template_infos, primary_key: :template_id, foreign_key: :template_id
  has_many :template_parts, through: :template_infos, source: :template_part
  has_many :templates_tags, primary_key: :template_id, foreign_key: :template_id
  has_many :tags, through: :templates_tags, source: :tag
  belongs_to :product_type, primary_key: :product_type_id, foreign_key: :product_type_id

  validates :template_name, presence: true
end
