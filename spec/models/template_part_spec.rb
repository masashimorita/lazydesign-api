require 'rails_helper'

RSpec.describe TemplatePart, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:part_name) }
    it { should validate_presence_of(:content_markup) }
  end

  describe "Association" do
    it "has many :template_infos" do
      should have_many(:template_infos)
    end
    it "has many :templates" do
      should have_many(:templates)
    end
  end
end
