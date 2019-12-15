require 'rails_helper'

RSpec.describe ProjectGroup, type: :model do
  describe "Model Validation" do
    subject { create(:project_group) }
    it { should validate_presence_of(:project_group_name) }
  end

  describe "Association" do
    it "belongs to :user" do
      should belong_to(:user)
    end
  end
end
