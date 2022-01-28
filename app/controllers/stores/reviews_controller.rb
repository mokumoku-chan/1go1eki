class Stores::ReviewsController < ApplicationController
  before_action :authenticate_store!, {only: [:index]}

  def index
    @reviews = Review.where(store_id: current_store.id).order(updated_at: :desc).page(params[:page])
  end
end
