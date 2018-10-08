class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
  
  def self.favorite_merchant(customer_id)
    Merchant.select("merchants.*, COUNT(invoices.id) AS invoice_total")
    .joins(:invoices)
    .where(invoices: { customer_id: customer_id })
    .group(:id)
    .order("invoice_total DESC")
    .limit(1)
    .first
  end
end
