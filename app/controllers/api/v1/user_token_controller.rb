module Api
  module V1
    class UserTokenController < Knock::AuthTokenController
      include Response
      skip_before_action :verify_authenticity_token

      def create
        user_json = response_fields(entity.to_json)
        user_json[:token] = auth_token.token
        response_success({user: user_json})
      end

      private
      def response_fields(user_json)
        user_parse = JSON.parse(user_json)
        user_parse.except('created_at', 'updated_at', 'password', 'password_digest')
      end
    end
  end
end
