class Merchant < ApplicationRecord
  validates_presence_of :name
  
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  
  def self.most_revenue(limit = 3)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(:invoices, :invoice_items)
    .group(:id)
    .order("total_revenue DESC")
    .limit(limit)
  end
  
  def self.most_items(limit = 3)
    select("merchants.*, sum(invoice_items.quantity) AS total_items")
    .joins(:invoices, :invoice_items)
    .group(:id)
    .order("total_items DESC")
    .limit(limit)
  end 
  
  # def self.revenue_by_date(date = "2012-03-27")
  #   select("sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
  #   .joins(:invoices, :invoice_items)
  #   .group(:created_at)
  #   .where(created_at: date)
  # end 
end
