class Users::StoresController < ApplicationController
  def index
    date = Date.today
    @often_use = Station.where(user_id: current_user.id)
    @stores = Store.find(1)


    @infos = Storeinfo.where("start_period <= ? and end_period >= ?", date, date)

  end


  def show
    @info = Storeinfo.find(params[:id])
    @store = Store.find(@info.store_id)
  end
end
