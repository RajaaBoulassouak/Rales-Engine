class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.all
  end

  def show
    result = InvoiceItem.find(params[:id])
    render json: result
  end
end