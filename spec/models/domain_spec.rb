require 'rails_helper'

RSpec.describe Domain, type: :model do
  describe "Model Validation" do
    subject { create(:domain) }
    it { should validate_presence_of(:domain_name) }
    it { should validate_uniqueness_of(:domain_name) }
  end

  describe "Association" do
    it "belongs to :user" do
      should belong_to(:user)
    end

    it "belongs to :project" do
      should belong_to(:project)
    end
  end
end
