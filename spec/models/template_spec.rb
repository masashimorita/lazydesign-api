require 'rails_helper'

RSpec.describe Template, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:template_name) }
  end

  describe "Association" do
    it "has many :template_infos" do
      should have_many(:template_infos)
    end
    it "has many :template_parts" do
      should have_many(:template_parts)
    end
    it "has many :template_parts" do
      should have_many(:tags)
    end
    it "has many :projects" do
      should have_many(:projects)
    end
    it "has many :configurations" do
      should have_many(:configurations)
    end
    it "belongs to :product_type" do
      should belong_to(:product_type)
    end
  end
end
