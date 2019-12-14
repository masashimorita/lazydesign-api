require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe "Model Validation" do
    subject { create(:plan) }
    it { should validate_presence_of(:stripe_plan_id) }
    it { should validate_presence_of(:plan_name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:interval) }
    it { should validate_numericality_of(:interval) }
  end

  describe "Association" do
    it "belongs to :plan_type" do
      should belong_to(:plan_type)
    end

    it "has many :permissions" do
      should have_many(:permissions)
    end
  end
end
