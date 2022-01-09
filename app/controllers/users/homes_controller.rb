class Users::HomesController < ApplicationController
  def top
  end


  def index
    @station = params[:station]
    binding.pry
  end
end
