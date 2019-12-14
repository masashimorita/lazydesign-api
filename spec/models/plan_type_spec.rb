require 'rails_helper'

RSpec.describe PlanType, type: :model do
  describe "Model Validation" do
    subject { create(:plan_type) }
    it { should validate_presence_of(:plan_type_id) }
    it { should validate_uniqueness_of(:plan_type_id) }
    it { should validate_numericality_of(:plan_type_id) }
    it { should validate_presence_of(:plan_type_name) }
  end

  describe "Association" do
    it "has many to :plans" do
      should have_many(:plans)
    end
  end
end
