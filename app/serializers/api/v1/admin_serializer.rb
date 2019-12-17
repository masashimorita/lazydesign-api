module Api
  module V1
    class AdminSerializer
      include FastJsonapi::ObjectSerializer
      set_id :admin_id

      attributes :admin_id, :name, :email, :is_super_admin
      attribute :token do |user, param|
        param[:token] rescue ''
      end
    end
  end
end
