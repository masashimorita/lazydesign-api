require 'rails_helper'

RSpec.describe Configuration, type: :model do
  describe "Model Validation" do
    subject { create(:configuration) }
    it { should validate_presence_of(:configuration_key) }
    it { should validate_presence_of(:configuration_value) }
  end

  describe "Association" do
    it "belongs to :configurator" do
      should belong_to(:configurator)
    end
  end
end
