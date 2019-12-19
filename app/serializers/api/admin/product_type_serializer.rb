module Api
  module Admin
    class ProductTypeSerializer
      include FastJsonapi::ObjectSerializer
      set_id :product_type_id

      attributes :product_type_id, :product_type_name
    end
  end
end
