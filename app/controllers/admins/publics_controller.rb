class Admins::PublicsController < ApplicationController
  def index
    @publics = Public.all
  end
end
