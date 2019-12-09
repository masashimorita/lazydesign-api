require "rails_helper"

RSpec.describe ConfigurationType, type: :model do
  describe "Model Validation" do
    subject { create(:configuration_type) }
    it { should validate_presence_of(:configuration_type_id) }
    it { should validate_uniqueness_of(:configuration_type_id) }
    it { should validate_numericality_of(:configuration_type_id) }
    it { should validate_presence_of(:configuration_type_name) }
  end
end
