class Api::V1::Merchants::RandomController < ApplicationController
  
  def show 
    render json: Merchant.all.sample(1)
  end 
end