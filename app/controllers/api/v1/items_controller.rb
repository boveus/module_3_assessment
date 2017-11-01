class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    render json: Item.find(params[:id].to_i)
  end

  def destroy
    Item.find(params[:id].to_i).destroy
    render :nothing => true, :status => 204
  end
end