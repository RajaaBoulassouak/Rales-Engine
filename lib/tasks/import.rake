require 'CSV'

namespace :import do
  desc "Import csv data"
  task data: :environment do
    
    CSV.foreach('./db/csv_data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
    puts "#{Merchant.count} Merchants in database"
    
    CSV.foreach('./db/csv_data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts "#{Customer.count} Customers in database"
    
    CSV.foreach('./db/csv_data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
    puts "#{Invoice.count} Invoices in database"
    
    CSV.foreach('./db/csv_data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
    puts "#{Item.count} Items in database"
    
    CSV.foreach('./db/csv_data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
    puts "#{InvoiceItem.count} Invoice-Items in database"
    
    CSV.foreach('./db/csv_data/transactions.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
    puts "#{Transaction.count} Transactios in database"
  end
end