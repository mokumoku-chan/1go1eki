class Users::UserpagesController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to mypage_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number, :profile_image)
  end

end
