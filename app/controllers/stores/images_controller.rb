class Stores::ImagesController < ApplicationController
  before_action :authenticate_store!, {only: [:edit, :create, :destroy]}

  def edit
    @images = StoreImage.where(store_id: current_store.id)
    @image_new = StoreImage.new
  end

  def create
    image = StoreImage.new(image_params)
    image.store_id = current_store.id
    image.save
    redirect_to edit_stores_image_path
  end

  def destroy
    image = StoreImage.find(params[:format])
    image.destroy
    redirect_to edit_stores_image_path
  end

  private
  def image_params
    params.require(:store_image).permit(:image)
  end
end
