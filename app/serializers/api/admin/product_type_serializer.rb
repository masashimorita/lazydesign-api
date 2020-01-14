module Api
  module Admin
    class ProductTypeSerializer < Api::BaseSerializer
      attributes :product_type_id, :product_type_name
    end
  end
end
