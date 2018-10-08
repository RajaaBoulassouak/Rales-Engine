class Api::V1::Items::RandomController < ApplicationController
  
  def show 
    render json: Item.all.sample(1)
  end 
end