require 'rails_helper'

RSpec.describe DeployHistory, type: :model do
  describe "Model Validation" do
    subject{ create(:deploy_history) }
    it { should validate_presence_of(:deployed_at) }
  end

  describe "Association" do
    it "belongs to :deploy_method" do
      should belong_to(:deploy_method)
    end

    it "belongs to :project" do
      should belong_to(:project)
    end
  end
end
