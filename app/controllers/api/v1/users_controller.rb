module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :authenticate_user, except: [:create]

      def show
        response_success(Api::V1::UserSerializer.new(current_user).serialized_json)
      end

      def create
        raise LazyDesign::ConflictError, "User Record Conflict Occurred" if User.exists?(email: sign_up_params[:email])
        raise LazyDesign::BadRequest if sign_up_params[:name].blank? || sign_up_params[:email].blank? || sign_up_params[:password].blank?

        @user = User.create!(sign_up_params)
        token = auth_token(@user).token
        response_item_created(Api::V1::UserSerializer.new(@user, {params: {token: token}}).serialized_json)
      end

      def update
        @user = current_user
        @user.update_attributes(update_params)
        @user.save!
        response_success(Api::V1::UserSerializer.new(@user))
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
