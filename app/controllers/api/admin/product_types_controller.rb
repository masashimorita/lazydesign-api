module Api
  module Admin
    class ProductTypesController < Api::Admin::BaseController
      before_action :authenticate_admin
      before_action :find_record, only: [:show, :update, :destroy]

      def index
        product_types = ProductType.all
        response_success(Api::Admin::ProductTypeSerializer.new(product_types).serialized_json)
      end

      def show
        response_success(Api::Admin::ProductTypeSerializer.new(@product_type).serialized_json)
      end

      def update
        if update_params[:product_type_name].blank?
          raise LazyDesign::InvalidParameterError, "Required parameter :product_type_name is not valid"
        end
        @product_type.update!(update_params)
        response_success(Api::Admin::ProductTypeSerializer.new(@product_type).serialized_json)
      end

      def create
        product_type = ProductType.create!(request_params)
        response_item_created(Api::Admin::ProductTypeSerializer.new(product_type).serialized_json)
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
