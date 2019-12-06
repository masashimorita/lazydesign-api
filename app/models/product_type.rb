class ProductType < ActiveRecord::Base
  self.primary_key = :product_type_id

  validates :product_type_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :product_type_name, presence: true
end
