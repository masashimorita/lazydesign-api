module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create, :logout]

      def index
        response_success(response_fields(current_user.to_json))
      end

      def create
        return response_conflict("User Conflict Error Occurred") if User.exists?(email: users_params[:email])
        return response_bad_request unless users_params[:name].blank?

        @user = User.create!(users_params)
      end

      private

      def users_params
        params.permit(:name, :email, :password)
      end

      def response_fields(user_json)
        user_parse = JSON.parse(user_json)
        user_parse.except('created_at', 'updated_at', 'password', 'password_digest')
      end
    end
  end
end