class Api::V1::Customers::CustomerTransactionsController < ApplicationController

  def show 
    transactions = Transaction.unscoped.all
    
    render json: Customer.find(params[:id]).transactions
  end
end