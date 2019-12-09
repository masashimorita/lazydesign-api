class Template < ApplicationRecord
  self.primary_key = :template_id
  before_create { self.id = Ulid.generate }

  belongs_to :product_type, primary_key: :product_type_id, foreign_key: :product_type_id

  validates :template_name, presence: true
end
