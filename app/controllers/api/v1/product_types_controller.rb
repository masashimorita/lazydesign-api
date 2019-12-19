module Api
  module V1
    class ProductTypesController < Api::V1::BaseController
      before_action :authenticate_user
      before_action :find_record, only: [:show]

      def index
        product_types = ProductType.all
        response_success(Api::V1::ProductTypeSerializer.new(product_types).serialized_json)
      end

      def show
        response_success(Api::V1::ProductTypeSerializer.new(@product_type).serialized_json)
      end

      private
      def find_record
        @product_type = ProductType.find_by(product_type_id: params[:id])
        raise LazyDesign::NotFoundError, "Product Type Record with #{params[:id]} Not Found" unless @product_type
      end
    end
  end
end
