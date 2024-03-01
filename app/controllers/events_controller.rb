class EventsController < ApplicationController

  def search

  end

  def index
    if params[:zipcode]
      @facade = EventFacade.new.events_by_zip(params[:zipcode])
      require 'pry'; binding.pry
    end
  end

  def new
    @user_id = session[:user_id]
    @user = session[:user_name]
    # redirect_to "/users/#{@user_id}/events"
  end
end
