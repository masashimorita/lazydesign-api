module Api
  module Admin
    class AdminSerializer < Api::BaseSerializer
      attributes :admin_id, :name, :email, :is_super_admin, :token
    end
  end
end
