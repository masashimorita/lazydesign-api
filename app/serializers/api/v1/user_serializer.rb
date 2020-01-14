module Api
  module V1
    class UserSerializer < Api::BaseSerializer
      attributes :user_id, :name, :email, :tutorial_completed, :token
      attribute :image do
        object.image ? object.image.url : nil
      end
    end
  end
end
