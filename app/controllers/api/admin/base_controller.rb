module Api
  module Admin
    class BaseController < ApplicationController
      include Knock::Authenticable

      private
      def auth_token(entity)
        if entity.respond_to? :to_token_payload
          Knock::AuthToken.new payload: entity.to_token_payload
        else
          Knock::AuthToken.new payload: { entity.primary_key => entity.id }
        end
      end
    end
  end
end
