require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Model Validation" do
    it { should validate_presence_of(:tag_name) }
  end

  describe "Association" do
    it "has many to :templates" do
      should have_many(:templates)
    end
    it "belongs to :tag_group" do
      should belong_to(:tag_group)
    end
  end
end
