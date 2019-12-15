require 'rails_helper'

RSpec.describe FileContent, type: :model do
  describe "Model Validation" do
    subject { create(:file_content) }
    it { should validate_presence_of(:content) }
  end

  describe "Association" do
    it "belongs to :file_type" do
      should belong_to(:file_type)
    end

    it "belongs to :page" do
      should belong_to(:page)
    end
  end
end
