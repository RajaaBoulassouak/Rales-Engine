require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do 
    create_list(:item, 3)
    
    get '/api/v1/items.json'
    
    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end 
  
  it 'gets one item by their id' do 
    id = create(:item).id
    
    get "/api/v1/items/#{id}.json"
    
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['id']).to eq(id)
  end
end