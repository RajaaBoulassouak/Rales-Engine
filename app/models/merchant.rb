class Merchant < ApplicationRecord
  validates_presence_of :name
  
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end
  
  def self.most_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS total_items")
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .order("total_items DESC")
    .limit(quantity)
  end 

  # def self.revenue(date)
  #   select("sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
  #   .joins(:invoices, :invoice_items)
  #   .group(:created_at)
  #   .where(created_at: date)
  # end
  
  def self.revenue(id)
    select("merchants.name, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .find(id)
    .total_revenue
  end
  
#   SELECT customers.*, sum(invoices.id) AS invoice_total FROM merchants INNER JOIN invoices ON merchants.id = invoices.merc
# hant_id INNER JOIN transactions ON invoices.id=transactions.invoice_id INNER JOIN customers ON customers.id=invoices.customer_id WHERE merchants.id
# =80 GROUP BY customers.id ORDER BY invoice_total DESC LIMIT 2;
  
  # def self.revenue_date(date)
  #   select("merchants.name, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
  #   .joins(invoices: [:invoice_items, :transactions])
  #   .group(:id)
  #   .find(date)
  #   .total_revenue
  # end
  
  def self.favorite_customer(id)
    select("customers.id, sum(invoices.id) AS invoice_total")
    .joins(invoices: [:transactions, :customers])
    .group("customers.id")
    .find(id)
    .order("invoice_total DESC")
    .first
  end
end
