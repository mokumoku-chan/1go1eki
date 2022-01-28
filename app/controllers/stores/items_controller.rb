class Stores::ItemsController < ApplicationController
  before_action :authenticate_store!, {only: [:index, :new, :create, :update, :show, :edit]}

  def index
    @items = Item.where(store_id: current_store.id).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.store_id = current_store.id
    if item.save
      redirect_to stores_items_path
    else
      render :new
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to stores_items_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
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
