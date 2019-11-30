module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: [:create]

      def index
        response_success(::UserSerializer.new(current_user).serialized_json)
      end

      def create
        raise LazyDesign::ConflictError, "User Record Conflict Occurred" if User.exists?(email: sign_up_params[:email])
        raise LazyDesign::BadRequest if sign_up_params[:name].blank?

        @user = User.create!(sign_up_params)
        token = auth_token(@user).token
        response_success(::UserSerializer.new(@user, {params: {token: token}}).serialized_json)
      end

      def update
        @user = current_user
        update_params.each do |key ,value|
          next if value.blank?
          @user[key] = value
        end
        @user.save!
        response_success(::UserSerializer.new(@user))
      end

      private

      def sign_up_params
        params.permit(:name, :email, :password)
      end

      def update_params
        params.permit(:name, :email)
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
