class Template < ApplicationRecord
  self.primary_key = :template_id
  before_create { self.id = Ulid.generate }

  has_many :template_infos, primary_key: :template_id, foreign_key: :template_id
  has_many :template_parts, through: :template_infos, source: :template_part
  belongs_to :product_type, primary_key: :product_type_id, foreign_key: :product_type_id

  validates :template_name, presence: true
end
