require 'rails_helper'

RSpec.describe Page, type: :model do
  describe "Model Validation" do
    subject { create(:page) }
    it { should validate_presence_of(:page_name) }
  end

  describe "Association" do
    it "belongs to :container" do
      should belong_to(:container)
    end

    it "has many :file_contents" do
      should have_many(:file_contents)
    end
  end
end
