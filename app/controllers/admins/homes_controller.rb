class Admins::HomesController < ApplicationController
  def top
    @users = User.all.limit(5)
    @stores = Store.all.limit(5)
  end
end
