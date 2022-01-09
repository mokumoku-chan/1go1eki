class Stores::UserpagesController < ApplicationController
  def show
    @store = Store.find(current_store.id)
  end

  def edit
    @store = Store.find(current_store.id)
  end

  def update
    store = Store.find(current_store.id)
    store.update(store_params)
    redirect_to stores_mypage_path
  end


  private
  def store_params
    params.require(:store).permit(:name, :email, :telephone_number, :postal_code, :address)
  end

end