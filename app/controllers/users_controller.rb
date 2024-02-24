class UsersController < ApplicationController
  def login_form

  end

  def login_user
    @user = UserFacade.new.find_by_email(params[:email])
    if @user #&& @user.authenticate(params[:password]) #this needs something on the backend (token?)
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Invalid email or password"
      render :login_form
    end
  end

  def new

  end

  def show
    @id = params[:id]
    @user_facade = UserFacade.new.user(params[:id])
  end

  def create
    conn = Faraday.new(url: "http://localhost:3000")

    request = conn.post("/api/v1/users") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.params = {user: { name: params[:name], email: params[:email], password: params[:password]}}
    end

    json = JSON.parse(request.body, symbolize_names: true)

    if params[:password] != params[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/register"
    elsif json[:id].present?
      redirect_to "/users/#{json[:id]}"
      flash[:success] = "Profile Created"
    elsif !params[:email].present? || !params[:name].present?
      flash[:error] = "Please fill in all fields"
      redirect_to "/register"
    else
      flash[:error] = "User could not be created: email #{json.values.join(', ')}"
      redirect_to "/register"
    end
  end

  def edit
    @id = params[:id]
    @user = UserFacade.new.user(params[:id])
  end

  def logout_user
    @user = UserFacade.new.user(session[:user_id])
    session.delete(:user_id)
    flash[:notice] = "Goodbye, #{@user.name}, See You Soon, Have a Great Day Until Next Time, Friend!"
    redirect_to root_path
  end

  def update
    if params[:password] == params[:password_confirmation]
      user = UserFacade.new.user(params[:id])
      response = UserFacade.new.update_user(user, params[:name], params[:email], params[:password])
      require 'pry'; binding.pry
      session[:user_id] = response[:user_id]
    end
   
  end
end
