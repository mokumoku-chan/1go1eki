class Users::ReviewsController < ApplicationController
  def index
    if user_signed_in?
      @reviews = Review.where(user_id: current_user.id)
    end
  end
end
