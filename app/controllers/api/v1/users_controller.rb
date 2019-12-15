module Api
  module V1
    class UsersController < Api::V1::ApiController
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
        params.require(:user).permit(:name, :email, :password)
      end

      def update_params
        params.require(:user).permit(:name, :email, :image, :tutorial_completed)
      end

      def auth_token(entity)
        if entity.respond_to? :to_token_payload
          Knock::AuthToken.new payload: entity.to_token_payload
        else
          Knock::AuthToken.new payload: { sub: entity.id }
        end
      end
    end
  end
end
