class HomesController < ApplicationController
  def top
    date = Date.current
    @infos = Storeinfo.where("start_period <= ? and end_period >= ?", date, date)
  end

  def about
  end
end
