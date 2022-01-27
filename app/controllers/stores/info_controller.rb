class Stores::InfoController < ApplicationController
  before_action :authenticate_store!, {only: [:new, :index, :show, :create, :edit, :update, :destroy]}

  def index

    date = Date.today

    @infos_all = Storeinfo.where(store_id: current_store.id)
    @infos = Storeinfo.where("store_id == ? and end_period >= ?", current_store.id, date)
  end

  def new
    # @store = Store.find(current_store.id)
    # @homepages = Homepage.where(store_id: current_store.id)
    @info = Storeinfo.new
  end

  def show
    @info = Storeinfo.find(params[:id])
  end

  def create
    info = Storeinfo.new(info_params)
    info.store_id = current_store.id
    if info.save
      redirect_to stores_info_index_path
    else
      @info = Storeinfo.new
      render :new
    end
  end

  def edit
    @info = Storeinfo.find(params[:id])
  end

  def update
    info = Storeinfo.find(params[:id])
    if info.update(info_params)
      redirect_to stores_info_path(info.id)
    else
      @info = Storeinfo.find(params[:id])
      render :edit
    end

  end

  def destroy
    info = Storeinfo.find(params[:id])
    info.destroy
    redirect_to stores_info_index_path
  end


  private
  def info_params
    params.require(:storeinfo).permit(:station, :start_period, :end_period, :open_time, :close_time, :place)
  end
end
