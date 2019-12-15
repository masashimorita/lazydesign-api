require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Model Validation" do
    subject{ create(:project) }
    it { should validate_presence_of(:project_name) }
  end

  describe "Association" do
    it "belongs to :product_type" do
      should belong_to(:product_type)
    end

    it "belongs to :template" do
      should belong_to(:template)
    end

    it "belongs to :user" do
      should belong_to(:user)
    end

    it "belongs to :project_status" do
      should belong_to(:project_status)
    end

    it "belongs to :project_group" do
      should belong_to(:project_group)
    end
  end
end
