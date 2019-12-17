module Api
  module V1
    class ApiController < ApplicationController
      include Knock::Authenticable

      private

      def authenticate_admin_or_user
        head(:unauthorized) unless authenticate_for(::Admin) || authenticate_for(::User)
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
