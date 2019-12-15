require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "Model Validation" do
    let!(:invoice) { create(:invoice) }
    it { should validate_presence_of(:stripe_customer_id) }
    it { should validate_presence_of(:stripe_invoice_id) }
    it { should validate_presence_of(:stripe_charge_id) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:subtotal) }
    it { should validate_numericality_of(:subtotal) }
    it { should allow_value(10.12).for(:subtotal) }
    it { should validate_presence_of(:tax) }
    it { should validate_numericality_of(:tax) }
    it { should allow_value(10.12).for(:tax) }
    it { should validate_presence_of(:tax_percent) }
    it { should validate_numericality_of(:tax_percent) }
    it { should validate_presence_of(:total) }
    it { should validate_numericality_of(:total) }
    it { should allow_value(10.12).for(:total) }
    it { should validate_numericality_of(:starting_balance) }
    it { should allow_value(10.12).for(:starting_balance) }
    it { should validate_numericality_of(:ending_balance) }
    it { should allow_value(10.00).for(:ending_balance) }
  end

  describe "Association" do
    it "belongs to :user" do
      should belong_to(:user)
    end
  end
end
