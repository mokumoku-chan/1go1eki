class HomesController < ApplicationController
  def top
    date = Date.today
    @infos = Storeinfo.where("start_period <= ? and end_period >= ?", date, date)
  end
end
