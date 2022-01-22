class Users::StorepagesController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @images = StoreImage.where(store_id: :id)
  end
end
