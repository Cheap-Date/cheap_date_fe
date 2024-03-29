class DatesController < ApplicationController

  def index
    @user = UserFacade.new.user(params[:id])
    @meetup_facade = MeetupFacade.find_meetup(@user.id)
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
      else 
        flash[:error] = "Please fill in all fields"
        redirect_to "/users/#{@user.id}/dates/new"
      end
    else 
      flash[:error] = "Please fill in all fields"
      redirect_to "/users/#{@user.id}/dates/new"
    end
  end

  def edit
    @user = UserFacade.new.user(params[:id])
    @meetup_facade = MeetupFacade.find_meetup_by_id(@user.id, params[:meetup_id])
  end

  def update
    @user = UserFacade.new.user(params[:id])
    @meetup_facade = MeetupFacade.find_meetup_by_id(@user.id, params[:meetup_id])
    if update_meetup_params
      response = MeetupFacade.update_meetup(update_meetup_params)
      if response.status == 200
        flash[:success] = "Date has been updated!"
        redirect_to "/users/#{@user.id}/meetups"
      else
        flash[:error] = "Please fill in all fields"
        redirect_back(fallback_location: "/users/#{@user.id}/meetups/#{params[:meetup_id]}")
      end
    end
    
  end

  private

  def meetup_params
    params.permit(:title, :location, :start_time, :end_time, :first_date, :id)
  end

  def update_meetup_params
    params.permit(:title, :location, :start_time, :end_time, :first_date, :id, :meetup_id)
  end
end
