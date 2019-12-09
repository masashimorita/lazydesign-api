require 'rails_helper'

RSpec.describe TemplatePart, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:part_name) }
    it { should validate_presence_of(:content_markup) }
  end
end
