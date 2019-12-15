require "rails_helper"

RSpec.describe DeployMethod, type: :model do
  describe "Model Validation" do
    subject { create(:deploy_method) }
    it { should validate_presence_of(:deploy_method_id) }
    it { should validate_uniqueness_of(:deploy_method_id) }
    it { should validate_numericality_of(:deploy_method_id) }
    it { should validate_presence_of(:deploy_method_name) }
    it { should validate_presence_of(:deploy_program) }
    it { should validate_presence_of(:entry_point) }
  end

  describe "Association" do
    it "has many :deploy_histories" do
      should have_many(:deploy_histories)
    end
  end
end
