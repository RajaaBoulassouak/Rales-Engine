class Api::V1::TransactionsController < ApplicationController
  
  def index
    render json: Transaction.unscoped.all
  end

  def show
    render json: Transaction.unscoped.find(params[:id])
  end
end