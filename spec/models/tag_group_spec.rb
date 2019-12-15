require 'rails_helper'

RSpec.describe TagGroup, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:group_name) }
  end

  describe "Association" do
    it "has many :tags" do
      should have_many(:tags)
    end
  end
end
