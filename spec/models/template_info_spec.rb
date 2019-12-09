require 'rails_helper'

RSpec.describe TemplateInfo, type: :model do
  describe "Association" do
    it "belongs to :templates" do
      should belong_to(:template)
    end
    it "belongs to :template_parts" do
      should belong_to(:template_part)
    end
  end
end
