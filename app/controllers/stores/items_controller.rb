class Stores::ItemsController < ApplicationController
  def index
    @items = Item.where(store_id: current_store.id).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.store_id = current_store.id
    item.save
    redirect_to stores_items_path
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to stores_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :comment, :price, :status)
  end
end
