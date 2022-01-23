class Users::HomesController < ApplicationController
  def top
        date = Date.today

    if user_signed_in?
      @often_use = Station.where(user_id: current_user.id)
    end

    @infos = Storeinfo.where("start_period <= ? and end_period >= ?", date, date)


  end
end
