module Api
  module V1
    class ProductTypesController < Api::V1::BaseController
      before_action :authenticate_user
      before_action :find_record, only: [:show]

      def index
        pagy, product_types = pagy(ProductType.all, page: params[:page] || 1)
        response_success(product_types, Api::V1::ProductTypeSerializer, pagination: pagy.vars)
      end

      def show
        response_success(@product_type, Api::V1::ProductTypeSerializer.new(@product_type))
      end

      private
      def find_record
        @product_type = ProductType.find_by(product_type_id: params[:id])
        raise LazyDesign::NotFoundError, "Product Type Record with #{params[:id]} Not Found" unless @product_type
      end
    end
  end
end
