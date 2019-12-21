module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user, except: [:create]

      def show
        response_success(current_user, Api::V1::UserSerializer)
      end

      def create
        raise LazyDesign::ConflictError, "User Record Conflict Occurred" if User.exists?(email: sign_up_params[:email])
        raise LazyDesign::BadRequest if sign_up_params[:name].blank? || sign_up_params[:email].blank? || sign_up_params[:password].blank?

        @user = User.create!(sign_up_params)
        @user[:token] = auth_token(@user).token
        response_item_created(@user, Api::V1::UserSerializer)
      end

      def update
        @user = current_user
        @user.update_attributes(update_params)
        @user.save!
        response_success(@user, Api::V1::UserSerializer)
      end

      private

      def sign_up_params
        params.permit(:name, :email, :password)
      end

      def update_params
        params.permit(:name, :email, :image, :tutorial_completed)
      end
    end
  end
end
