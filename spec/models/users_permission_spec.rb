require 'rails_helper'

RSpec.describe UsersPermission, type: :model do
  describe "Association" do
    it "belongs to :user" do
      should belong_to(:user)
    end

    it "belongs to :permission" do
      should belong_to(:permission)
    end
  end
end
