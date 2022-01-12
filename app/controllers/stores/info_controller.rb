class Stores::InfoController < ApplicationController

  def index
    @infos = Storeinfo.where(store_id: current_store.id)
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
    info.save
    redirect_to stores_info_index_path
  end

  def edit
    @info = Storeinfo.find(params[:id])
  end

  def update
    info = Storeinfo.find(params[:id])
    info.update(info_params)
    redirect_to stores_info_path(info.id)

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
