class Admins::StoresController < ApplicationController
  before_action :authenticate_admin!, {only: [:index, :show, :edit, :update]}

  def index
    @stores = Store.page(params[:page])
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to admins_store_path(store.id)
  end

  private
  def store_params
    params.require(:store).permit(:name, :email, :telephone_number, :postal_code, :address, :is_active)
  end
end
