require 'rails_helper'

RSpec.describe TemplatesTag, type: :model do
  describe "Association" do
    it "belongs to :template" do
      should belong_to(:template)
    end

    it "belongs to :tag" do
      should belong_to(:tag)
    end
  end
end
