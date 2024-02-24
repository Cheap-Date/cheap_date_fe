class DatesController < ApplicationController

  def index
    @user = UserFacade.new.user(params[:id])
  end

  def new

  end
end
