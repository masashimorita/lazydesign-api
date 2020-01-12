module Api
  module Admin
    class ProductTypesController < Api::Admin::BaseController
      before_action :authenticate_admin
      before_action :find_record, only: [:show, :update, :destroy]

      def index
        pagy, product_types = pagy(ProductType.all, page: params[:page] || 1)
        response_success(product_types, Api::Admin::ProductTypeSerializer)
      end

      def show
        response_success(@product_type, Api::Admin::ProductTypeSerializer)
      end

      def update
        if update_params[:product_type_name].blank?
          raise LazyDesign::InvalidParameterError, "Required parameter :product_type_name is not valid"
        end
        @product_type.update!(update_params)
        response_success(@product_type, Api::Admin::ProductTypeSerializer)
      end

      def create
        product_type = ProductType.create!(request_params)
        response_item_created(product_type, Api::Admin::ProductTypeSerializer)
      end

      def destroy
        @product_type.destroy!
        response_success({message: "Product Type Record has been deleted successfully"})
      end

      private

      def request_params
        params.permit(:product_type_id, :product_type_name)
      end

      def update_params
        params.permit(:product_type_name)
      end

      def find_record
        @product_type = ProductType.find_by(product_type_id: params[:id])
        raise LazyDesign::NotFoundError, "Product Type Record with #{params[:id]} Not Found" unless @product_type
      end
    end
  end
end
