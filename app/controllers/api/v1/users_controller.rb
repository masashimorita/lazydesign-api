module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create, :logout]

      def index
        response_success(UserSerializer.new(current_user).serialized_json)
      end

      def create
        return response_conflict("User Conflict Error Occurred") if User.exists?(email: users_params[:email])
        return response_bad_request if users_params[:name].blank?

        @user = User.create!(users_params)
        token = auth_token(@user).token
        response_success(UserSerializer.new(@user, {params: {token: token}}).serialized_json)
      end

      private

      def users_params
        params.permit(:name, :email, :password)
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
