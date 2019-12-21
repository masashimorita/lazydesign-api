module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      include Response
      skip_before_action :verify_authenticity_token

      def create
        entity[:token] = auth_token.token
        response_success(entity, Api::V1::UserSerializer)
      end

      private
      def auth_params
        params.permit(:email, :password)
      end
    end
  end
end
