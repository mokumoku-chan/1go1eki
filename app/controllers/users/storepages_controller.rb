class Users::StorepagesController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @images = StoreImage.where(store_id: @store.id)
    images_arr = @images.map {|image| Refile.attachment_url(image, :image)}
    @images_arr = images_arr.to_json.html_safe
    @homepages = Homepage.where(store_id: @store.id)

    date = Date.today
    @infos = Storeinfo.where("store_id == ? and end_period >= ?",@store.id, date)
  end
end
