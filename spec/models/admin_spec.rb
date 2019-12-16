require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Model Validation" do
    subject { create(:admin) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
