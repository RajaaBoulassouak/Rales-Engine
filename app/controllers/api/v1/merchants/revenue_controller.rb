class Api::V1::Merchants::RevenueController < ApplicationController 
  
  def index 
    render json: Merchant.revenue(params[:date]) 
  end 
  
  def show 
    merchant_revenue = Merchant.revenue(params[:id]).round(2)/100
    render json: {"revenue" => merchant_revenue.to_json}
  end 
end 