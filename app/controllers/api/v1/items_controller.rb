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

  def create
    @item = Item.create(item_params)
    if @item
      # render json: Item.find(@item.id)
      render json: @item, :status => 201
    else
      render :nothing => true, :status => 400
      #look up more specific response code later
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

  def id_params
    params.permit(:id)
  end
end
