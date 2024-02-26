class DatesController < ApplicationController

  def index
    @user = UserFacade.new.user(params[:id])
  end

  def new
    @user = UserFacade.new.user(params[:id])
  end

  def create
    @user = UserFacade.new.user(params[:id])
    if meetup_params
      response = MeetupFacade.create_meetup(params[:name], params[:date], params[:time], params[:description], params[:first_date], @user.id)
    end
    # require 'pry'; binding.pry
  end

  private

  def meetup_params
    params.permit(:name, :date, :time, :description, :first_date, :id)
  end
end
