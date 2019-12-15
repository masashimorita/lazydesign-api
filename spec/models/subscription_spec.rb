require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "Model Validation" do
    subject { create(:subscription) }
    it { should validate_presence_of(:stripe_subscription_id) }
    it { should validate_presence_of(:active_until) }
  end

  describe "Association" do
    it "belongs to :plan" do
      should belong_to(:plan)
    end

    it "belongs to :user" do
      should belong_to(:user)
    end
  end
end
