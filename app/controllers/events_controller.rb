class EventsController < ApplicationController

  def search

  end

  def index
    @user = UserFacade.new.user_find(params[:id])
    if params[:zipcode]
      facade = EventFacade.new
      @events = facade.events_by_zip(params[:zipcode])
    end
  end

  def new
    @user_id = session[:user_id]
    @user = session[:user_name]
    # redirect_to "/users/#{@user_id}/events"
  end
end