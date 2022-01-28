class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    if @current_user == nil
      flash[:notice]="ログインしてください"
      redirect_to new_user_session_path
    end
  end

  def authenticate_store
    if @current_store == nil
      flash[:notice]="ログインしてください"
      redirect_to new_store_session_path
    end
  end

  def authenticate_admin
    if @current_store == nil
      flash[:notice]="ログインしてください"
      redirect_to new_store_session_path
    end
  end

end
