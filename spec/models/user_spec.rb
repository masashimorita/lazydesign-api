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

    it "has many :projects" do
      should have_many(:projects)
    end

    it "has many :domains" do
      should have_many(:domains)
    end
  end

  describe "#from_token_payload" do
    let!(:user) { create(:user) }
    let(:payload) { { user_id: user.id }.with_indifferent_access }
    it "return user when payload has :user_id & is valid" do
      expect(User.from_token_payload(payload)).to eq user
    end

    it "return nil when payload dose not have :user_id" do
      expect(User.from_token_payload({ invalid: true })).to be nil
    end

    it "return nil when payload has :user_id but invalid" do
      expect(User.from_token_payload({ user_id: "invalid" })).to be nil
    end
  end

  describe "#to_token_payload" do
    let!(:user) { create(:user) }
    let(:expected_payload) { { user_id: user.id } }
    it "return payload to use in generating JSON Web Token" do
      expect(user.send(:to_token_payload)).to eq expected_payload
    end
  end
end
