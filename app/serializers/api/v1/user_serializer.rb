module Api
  module V1
    class UserSerializer
      include FastJsonapi::ObjectSerializer

      attributes :id, :name, :email
      attribute :token do |user, param|
        param[:token] rescue ''
      end
    end
  end
end
