class Users::ReviewsController < ApplicationController
  before_action :authenticate_user!, {only: [:index, :show]}

  def index
      @reviews = Review.where(user_id: current_user.id).order(updated_at: :desc)
  end


  def edit
    @review = Review.find(params[:id])
  end


  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to users_reviews_path
  end


  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to users_reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:evaluation, :title, :comment)
  end

end
