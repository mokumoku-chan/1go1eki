class Users::UserpagesController < ApplicationController
  before_action :authenticate_user!, {only: [:show, :edit, :create, :update, :destroy, :unsubscribe, :withdraw]}

  def show
    @user = User.find(current_user.id)
    @stations = Station.where(user_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
    @stations = Station.where(user_id: current_user.id)
    @station_new = Station.new


  end

  def create
    station = Station.new(station_params)
    registered = Station.where(name: station.name, user_id: current_user.id)

    if registered.blank?
        station.user_id = current_user.id

        if station.save
          redirect_to users_mypage_path
        else
          @user = User.find(current_user.id)
          @stations = Station.where(user_id: current_user.id)
          @station_new = Station.new

          render :edit
        end
    else
        redirect_to users_mypage_path
    end
  end

  def update
    user = User.find(current_user.id)

    if user.update(user_params)
      redirect_to users_mypage_path
    else
      @user = User.find(current_user.id)
      @stations = Station.where(user_id: current_user.id)
      @station_new = Station.new

      render :edit
    end
  end

  def destroy
    station = Station.find(params[:format])
    station.destroy
    redirect_to users_mypage_edit_path
  end

  def unsubscribe
  end

  def withdraw
    user = User.find(current_user.id)
    user.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number, :profile_image)
  end

  def station_params
    params.require(:station).permit(:name)
  end

end