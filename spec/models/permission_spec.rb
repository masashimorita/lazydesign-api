require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe "Model Validation" do
    subject { create(:permission) }
    it { should validate_presence_of(:permission_id) }
    it { should validate_uniqueness_of(:permission_id) }
    it { should validate_numericality_of(:permission_id) }
    it { should validate_presence_of(:permitted_target) }
    it { should validate_presence_of(:permitted_operation) }
  end

  describe "Association" do
    it "has many :users" do
      should have_many(:users)
    end

    it "has many :plans" do
      should have_many(:plans)
    end
  end
end
