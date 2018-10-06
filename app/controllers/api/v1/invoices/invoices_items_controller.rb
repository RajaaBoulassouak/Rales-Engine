class Api::V1::Invoices::InvoicesItemsController < ApplicationController
  def show
    render json: Invoice.find(params[:id]).items
  end
end