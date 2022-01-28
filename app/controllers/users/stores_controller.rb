class Users::StoresController < ApplicationController
  def index
    date = Date.today

    if params[:type] == "station"
      @infos = Storeinfo.search(params[:search]).where("start_period <= ? and end_period >= ?", date, date)
      @infos_all = Storeinfo.search(params[:search]).where("end_period >= ?" ,date)
      @type = 0

    else
      @store = Store.search(params[:search])
      @type = 1
      @date = date

    end
  end

  def show
    @info = Storeinfo.find(params[:id])
    @store = Store.find(@info.store_id)
  end
end
