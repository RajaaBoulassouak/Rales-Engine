require 'rails_helper'

describe 'Transactions API' do
  it 'sends a list of invoice_items' do 
    create_list(:transaction, 3)
    
    get '/api/v1/transactions.json'
    
    expect(response).to be_successful
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end 
  
  it 'gets one transaction by their id' do 
    id = create(:transaction).id
    
    get "/api/v1/transactions/#{id}.json"
    
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transaction['id']).to eq(id)
  end
end