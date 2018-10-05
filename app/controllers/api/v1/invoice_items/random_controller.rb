class Api::V1::InvoiceItems::RandomController < ApplicationController
  
  def show 
    render json: InvoiceItem.all.sample(1)
  end 
end