require "rails_helper"

RSpec.describe User, type: :model do
  describe "Model Validation" do
    subject { create(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "Association" do
    it "has many :permissions" do
      should have_many(:permissions)
    end
  end
end
