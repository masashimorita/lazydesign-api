require 'rails_helper'

RSpec.describe ProjectStatus, type: :model do
  describe "Model Validation" do
    subject { create(:project_status) }
    it { should validate_presence_of(:project_status_id) }
    it { should validate_uniqueness_of(:project_status_id) }
    it { should validate_numericality_of(:project_status_id) }
    it { should validate_presence_of(:project_status_name) }
  end

  describe "Association" do
    it "has many :projects" do
      should have_many(:projects)
    end
  end
end
