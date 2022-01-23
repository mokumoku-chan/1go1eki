class Stores::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(store_id: current_user.id).order(updated_at: :desc)
  end
end
