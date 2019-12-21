module Api
  module Admin
    class AdminSerializer < ActiveModel::Serializer
      attributes :admin_id, :name, :email, :is_super_admin, :token
    end
  end
end
