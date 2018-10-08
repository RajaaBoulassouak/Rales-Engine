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

  def self.date_revenue(date)
    joins(invoices: [:invoice_items, :transactions])
    .where(invoices: {created_at: date.to_date.beginning_of_day..date.to_date.end_of_day} )
    .sum('quantity*unit_price')  
  end
  
  def self.revenue(params)
    select("merchants.name, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .group(:id)
    .find(params['id'])
    .total_revenue
  end
    
  def self.merchant_revenue_by_date(params)
    joins(invoices: [:invoice_items, :transactions])
    .where(invoices: {created_at: params['date'].to_date.beginning_of_day..params['date'].to_date.end_of_day} )
    .where('merchants.id = ?', params['id'])
    .sum('quantity*unit_price')
  end
  
  def self.favorite_customer(merchant_id)
    Customer.select("customers.*, COUNT(invoices.id) AS invoice_total")
    .joins(invoices: :transactions)
    .where(invoices: { merchant_id: merchant_id })
    .group(:id)
    .order("invoice_total DESC")
    .limit(1)
    .first
  end
end