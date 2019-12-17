require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Model Validation" do
    subject { create(:admin) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "#from_token_payload" do
    let!(:admin) { create(:admin) }
    let(:payload) { { admin_id: admin.id }.with_indifferent_access }
    it "return admin when payload has :admin_id & is valid" do
      expect(Admin.from_token_payload(payload)).to eq admin
    end

    it "return nil when payload dose not have :admin_id" do
      expect(Admin.from_token_payload({ invalid: true })).to be nil
    end

    it "return nil when payload has :admin_id but invalid" do
      expect(Admin.from_token_payload({ admin_id: "invalid" })).to be nil
    end
  end

  describe "#to_token_payload" do
    let!(:admin) { create(:admin) }
    let(:expected_payload) { { admin_id: admin.id } }
    it "return payload to use in generating JSON Web Token" do
      expect(admin.send(:to_token_payload)).to eq expected_payload
    end
  end
end
