require 'rails_helper'

RSpec.describe Template, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:template_name) }
  end

  describe "Association" do
    context "with :product_type" do
      it { should belong_to(:product_type) }
    end
  end
end
