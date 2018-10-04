require 'rails_helper'

describe 'Merchants API' do
  it 'sends a list of merchants' do 
    create_list(:merchant, 3)
    
    get '/api/v1/merchants.json'
    
    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(3)
  end 
  
  it 'gets one merchant by their id' do 
    id = create(:merchant).id
    
    get "/api/v1/merchants/#{id}.json"
    
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['id']).to eq(id)
  end
end