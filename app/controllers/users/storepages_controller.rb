class Users::StorepagesController < ApplicationController

  def show
    @store = Store.find(params[:id])
    @images = StoreImage.where(store_id: @store.id)
    images_arr = @images.map {|image| Refile.attachment_url(image, :image)}
    @images_arr = images_arr.to_json.html_safe
    @homepages = Homepage.where(store_id: @store.id)

    date = Date.current
    @infos = Storeinfo.where(store_id: @store.id, start_period: date .. Float::INFINITY)

    @review_new = Review.new
    @reviews = Review.where(store_id: @store.id).order(updated_at: :desc)
    @items = Item.where(store_id: @store.id, status: 0)

  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    if review.save
      redirect_to users_storepage_path(review.store_id)
    else
      @store = Store.find(params[:id])
      @images = StoreImage.where(store_id: @store.id)
      images_arr = @images.map {|image| Refile.attachment_url(image, :image)}
      @images_arr = images_arr.to_json.html_safe
      @homepages = Homepage.where(store_id: @store.id)

      date = Date.today
      # @infos = Storeinfo.where("store_id == ? and start_period >= ?",@store.id, date)
      @infos = Storeinfo.where(store_id: @store.id, start_period: date .. Float::INFINITY)
      @review_new = Review.new
      @reviews = Review.where(store_id: @store.id).order(updated_at: :desc)
      # @items = Item.where("store_id == ? and status == ?", @store.id, 0)
      @items = Item.where(store_id: @store.id, status: 0)

      render :show
    end

  end

  private
  def review_params
    params.require(:review).permit(:store_id, :title, :comment, :evaluation)
  end
end
