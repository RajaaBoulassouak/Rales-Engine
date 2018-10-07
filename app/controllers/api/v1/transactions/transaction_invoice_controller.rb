class Api::V1::Transactions::TransactionInvoiceController < ApplicationController
  
  def show 
    render json: Transaction.unscoped.find(params[:id]).invoice 
  end
end 