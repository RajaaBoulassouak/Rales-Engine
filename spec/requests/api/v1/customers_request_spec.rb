require 'rails_helper'

describe 'Customers API' do
  it 'sends a list of customers' do 
    create_list(:customer, 3)
    
    get '/api/v1/customers.json'
    
    expect(response).to be_successful
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(3)
  end 
  
  it 'gets one customer by their id' do 
    id = create(:customer).id
    
    get "/api/v1/customers/#{id}.json"
    
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['id']).to eq(id)
  end
  
  it 'sends a list of invoices for a specific customer' do 
    id = create(:customer).id
    create_list( :invoice, 
                 3, 
                 customer_id: id
                )
                            
    get "/api/v1/customers/#{id}/invoices"
    
    invoices = JSON.parse(response.body)           
    expect(response).to be_successful
    expect(invoices.count).to eq(3)                  
  end 
  
  it 'sends a list of transactions for a specific customer' do 
    id = create(:customer).id
    invoice = create(:invoice, customer_id: id)
    create_list( :transaction, 
                 3, 
                 invoice_id: invoice.id)
                            
    get "/api/v1/customers/#{id}/transactions"
    
    transactions = JSON.parse(response.body)           
    expect(response).to be_successful
    expect(transactions.count).to eq(3)                  
  end 
end 