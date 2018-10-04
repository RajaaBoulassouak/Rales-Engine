class Api::V1::Merchants::RevenueController < ApplicationController 
  
  def index 
    render json: Merchant.revenue(params[:date]) 
  end 
  
  def show 
  
  end 
end 