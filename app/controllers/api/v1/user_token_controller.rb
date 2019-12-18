module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      include Response
      skip_before_action :verify_authenticity_token

      def create
        response_success(Api::V1::UserSerializer.new(entity, {params: {token: auth_token.token}}).serialized_json)
      end

      private
      def auth_params
        params.permit(:email, :password)
      end
    end
  end
end
