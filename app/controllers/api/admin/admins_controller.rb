module Api
  module Admin
    class AdminsController < Api::Admin::BaseController
      before_action :authenticate_admin, except: [:create]

      def show
        response_success(current_admin, Api::Admin::AdminSerializer)
      end

      def create
        raise LazyDesign::ConflictError, "Admin Record Conflict Occurred" if ::Admin.exists?(email: sign_up_params[:email])
        raise LazyDesign::BadRequest if sign_up_params[:name].blank? || sign_up_params[:email].blank? || sign_up_params[:password].blank?

        @admin = ::Admin.create!(sign_up_params)
        @admin[:token] = auth_token(@admin).token
        response_item_created(@admin, Api::Admin::AdminSerializer)
      end

      def update
        @admin = current_admin
        @admin.update_attributes(update_params)
        @admin.save!
        response_success(@admin, Api::Admin::AdminSerializer)
      end

      private

      def sign_up_params
        params.permit(:name, :email, :password)
      end

      def update_params
        params.permit(:name, :email)
      end
    end
  end
end
