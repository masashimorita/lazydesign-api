require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe "Model Validation" do
    subject { create(:permission) }
    it { should validate_presence_of(:permission_id) }
    it { should validate_uniqueness_of(:permission_id) }
    it { should validate_numericality_of(:permission_id) }
    it { should validate_presence_of(:permission_code) }
    it { should validate_presence_of(:permission_description) }
  end

  describe "Association" do
    it "has many :users" do
      should have_many(:users)
    end
  end
end
