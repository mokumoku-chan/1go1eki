class Users::FavoritesController < ApplicationController

  def create
    store = Store.find(params[:store_id])
    favorite = current_user.favorites.new(store_id: store.id)
    favorite.save
    redirect_to users_stores_path
  end

  def destroy
    store = Store.find(params[:store_id])
    favorite = current_user.favorites.find_by(store_id: store.id)
    favorite.destroy
    redirect_to users_stores_path
  end
end
