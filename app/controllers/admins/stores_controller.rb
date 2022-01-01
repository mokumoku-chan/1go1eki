class Admins::StoresController < ApplicationController

  def index
    @stores = Store.all
  end
end
