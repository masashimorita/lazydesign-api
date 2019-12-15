require "rails_helper"

RSpec.describe FileType, type: :model do
  describe "Model Validation" do
    subject { create(:file_type) }
    it { should validate_presence_of(:file_type_id) }
    it { should validate_uniqueness_of(:file_type_id) }
    it { should validate_numericality_of(:file_type_id) }
    it { should validate_presence_of(:file_type_name) }
    it { should validate_presence_of(:file_extension)}
  end

  describe "Association" do
    it "has many :file_contents" do
      should have_many(:file_contents)
    end
  end
end
