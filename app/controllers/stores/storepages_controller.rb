class Stores::StorepagesController < ApplicationController

  def show
    @store = Store.find(current_store.id)
    @homepages = Homepage.where(store_id: current_store.id)
  end

  def edit
    @store = Store.find(current_store.id)
    @homepages = Homepage.where(store_id: current_store.id)

    if @homepages.blank?
      @homepages = Homepage.new
      @homepage_info = 0

    else
      @homepage_info = 1
    end

  end


  def create
    homepage = Homepage.new(url_params)
    homepage.store_id = current_store.id
    homepage.save
    redirect_to stores_storepage_path
  end



  def update
    store = Store.find(current_store.id)
    store.update(store_params)
    redirect_to stores_storepage_path
  end


  private
  def store_params
    params.require(:store).permit(:name, :telephone_number, :postal_code, :address, :introduction)
  end

  def url_params
    params.require(:homepage).permit(:url, :url_type)
  end
end
