require 'rails_helper'

RSpec.describe PlansPermission, type: :model do
  describe "Association" do
    it "belongs to :permission" do
      should belong_to(:permission)
    end

    it "belongs to :plan" do
      should belong_to(:plan)
    end
  end
end
