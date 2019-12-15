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

    it "has many :subscriptions" do
      should have_many(:subscriptions)
    end

    it "has many :plans" do
      should have_many(:plans)
    end

    it "has many :invoices" do
      should have_many(:invoices)
    end

    it "has many :project_groups" do
      should have_many(:project_groups)
    end
  end
end
