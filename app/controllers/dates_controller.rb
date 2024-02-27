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
      response = MeetupFacade.create_meetup(params[:title], params[:location], params[:start_time], params[:end_time], params[:first_date], @user.id)
      if response.status == 201
        redirect_to "/users/#{@user.id}/meetups"
      end
    end
    
  end

  private

  def meetup_params
    params.permit(:title, :location, :start_time, :end_time, :first_date, :id)
  end
end
