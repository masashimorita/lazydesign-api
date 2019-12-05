module Api
  module V1
    class UserSerializer
      include FastJsonapi::ObjectSerializer
      set_id :user_id

      attributes :user_id, :name, :email
      attribute :token do |user, param|
        param[:token] rescue ''
      end
    end
  end
end
