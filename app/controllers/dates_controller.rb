class DatesController < ApplicationController

  def index
    @user = UserFacade.new.user(params[:id])
  end

  def new
    @user = UserFacade.new.user(params[:id])
    # require 'pry'; binding.pry
  end
end
