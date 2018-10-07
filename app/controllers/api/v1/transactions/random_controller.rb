class Api::V1::Transactions::RandomController < ApplicationController
  
  def show 
    render json: Transaction.unscoped.all.sample(1)
  end 
end