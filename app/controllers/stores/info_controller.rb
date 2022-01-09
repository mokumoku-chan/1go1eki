class Stores::InfoController < ApplicationController

  def new
    @store = Store.find(current_store.id)
    @homepages = Homepage.where(store_id: current_store.id)
    @info = Storeinfo.new
  end

  def show
    @store = Store.find(current_store.id)
  end
end
