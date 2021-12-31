class Admins::PublicsController < ApplicationController
  def index
    @publics = Public.all
  end

  def show
    @public_user = Public.find(params[:id])
  end

end
