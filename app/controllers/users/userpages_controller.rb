class Users::UserpagesController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @stations = Station.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
    @stations = Station.where(user_id: current_user.id)
    @station_new = Station.new
  end

  def create
    station = Station.new(station_params)
    station.user_id = current_user.id
    station.save
    redirect_to users_mypage_path
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to users_mypage_path
  end

  def destroy
    station = Station.find(params[:format])
    station.destroy
    redirect_to users_mypage_edit_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number, :profile_image)
  end

  def station_params
    params.require(:station).permit(:name)
  end

end