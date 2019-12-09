require "rails_helper"

RSpec.describe ProductType, type: :model do
  describe "Model Validation" do
    subject { create(:product_type) }
    it { should validate_presence_of(:product_type_id) }
    it { should validate_uniqueness_of(:product_type_id) }
    it { should validate_numericality_of(:product_type_id) }
    it { should validate_presence_of(:product_type_name) }
  end

  describe "Association" do
    it "has many :templates" do
      should have_many(:templates)
    end
  end
end
