module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create, :logout]

      def index
        response_success(response_fields(current_user.to_json))
      end

      def create
        return response_conflict("User Conflict Error Occurred") if User.exists?(email: users_params[:email])
        return response_bad_request if users_params[:name].blank?

        @user = User.create!(users_params)
        token = auth_token(@user).token
        user_json = response_fields(@user.to_json).merge(token: token)
        response_success(user_json)
      end

      private

      def users_params
        params.permit(:name, :email, :password)
      end

      def response_fields(user_json)
        user_parse = JSON.parse(user_json)
        user_parse.except('created_at', 'updated_at', 'password', 'password_digest')
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
