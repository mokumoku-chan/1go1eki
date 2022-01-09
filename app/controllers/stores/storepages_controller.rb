class Stores::StorepagesController < ApplicationController

  def show
    @store = Store.find(current_store.id)
    @homepages = Homepage.where(store_id: current_store.id)
  end
end
