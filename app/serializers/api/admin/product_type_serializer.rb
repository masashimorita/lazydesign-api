module Api
  module Admin
    class ProductTypeSerializer < ActiveModel::Serializer
      attributes :product_type_id, :product_type_name
    end
  end
end
