class Stores::StorepagesController < ApplicationController

  def show
    @store = Store.find(current_store.id)
    @images = StoreImage.where(store_id: current_store.id)
    images_arr = @images.map {|image| Refile.attachment_url(image, :image)}
    @images_arr = images_arr.to_json.html_safe
    @homepages = Homepage.where(store_id: current_store.id)
    @reviews = Review.where(store_id: @store.id).order(updated_at: :desc)
    @items = Item.where(store_id: @store.id)

  end


  def edit
    @store = Store.find(current_store.id)
    @homepages = Homepage.where(store_id: current_store.id)
    @homepage_new = Homepage.new

  end

  def create
    homepage = Homepage.new(url_params)
    homepage.store_id = current_store.id
    homepage.save
    redirect_to stores_storepage_path
  end


  def update
    if params[:change_id] == "0"
      store = Store.find(current_store.id)
      store.update(store_params)

    elsif params[:change_id] == "1"
      homepage = Homepage.where(store_id: current_store.id)
      homepage.update(url_params)
    end

    redirect_to stores_storepage_path
  end

  def destroy
    homepage = Homepage.find(params[:format])
    homepage.destroy
    redirect_to stores_storepage_path
  end


  def unsubscribe
  end

  def withdraw
    store = Store.find(current_store.id)
    store.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private
  def store_params
    params.require(:store).permit(:name, :email, :telephone_number, :postal_code, :address, :introduction)
  end

  def url_params
    params.require(:homepage).permit(:url, :url_type)
  end
end
