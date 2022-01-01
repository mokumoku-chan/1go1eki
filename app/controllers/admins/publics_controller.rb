class Admins::PublicsController < ApplicationController
  def index
    @publics = Public.all
  end

  def show
    @public_user = Public.find(params[:id])
  end

  def edit
    @public_user = Public.find(params[:id])
  end

  def update
    public_user = Public.find(params[:id])
    public_user.update(public_params)
    redirect_to admins_public_path(public_user.id)
  end


  private
  def public_params
    params.require(:public).permit(:name, :email, :telephone_number, :is_active)
  end

end
