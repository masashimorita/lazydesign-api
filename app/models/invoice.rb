class Invoice < ApplicationRecord
  self.primary_key = :invoice_id
  before_create { self.id = Ulid.generate }

  belongs_to :user, primary_key: :user_id, foreign_key: :user_id

  validates_presence_of :stripe_customer_id, :stripe_invoice_id, :stripe_charge_id, :currency
  validates :closed, allow_blank: true, inclusion: [true, false]
  validates :paid, allow_blank: true, inclusion: [true, false]
  validates :subtotal, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :tax, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :tax_percent, presence: true, numericality: { only_integer: true }
  validates :total, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :starting_balance, allow_blank: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :ending_balance, allow_blank: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end
