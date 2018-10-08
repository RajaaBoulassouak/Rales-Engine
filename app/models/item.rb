class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  
  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end
  
  def self.most_items(quantity)
    select("items.*, sum(invoice_items.quantity) AS total_items")
    .joins(:invoice_items)
    .group(:id)
    .order("total_items DESC")
    .limit(quantity)
  end
  
  def self.best_day(item_id)
    Invoice.select("invoices.*, sum(invoice_items.quantity) AS total_sales")
    .joins(:invoice_items)
    .find(invoice_items: {item_id: item_id} )
    .group(:id)
    .order("total_sales DESC")
    .limit(1)
    .first
    .created_at
  end
end
