require 'rails_helper'

describe 'InvoiceItems API' do
  it 'sends a list of invoice_items' do 
    create_list(:invoice_item, 3)
    
    get '/api/v1/invoice_items.json'
    
    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end 
  
  it 'gets one invoice_item by their id' do 
    id = create(:invoice_item).id
    
    get "/api/v1/invoice_items/#{id}.json"
    
    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_item['id']).to eq(id)
  end
end