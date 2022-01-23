class Stores::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(store_id: current_store.id).order(updated_at: :desc).page(params[:page])
  end
end
