class Api::V1::Merchants::RevenueController < ApplicationController 
  
  def index 
    merchants_revenue = Merchant.date_revenue(params[:date]).round(2)/100
    render json: { "total_revenue" => merchants_revenue.to_json }
  end 
  
  def show 
    if params[:date]
      merchant_revenue_date = Merchant.merchant_revenue_by_date(params).round(2)/100
      render json: { "revenue" => merchant_revenue_date.to_json }
    else
      merchant_revenue = Merchant.revenue(params).round(2)/100
      render json: { "revenue" => merchant_revenue.to_json } 
    end
  end 
end 