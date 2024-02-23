class UsersController < ApplicationController
  def login_form

  end

  def login_user

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
    end
    redirect_to "/users/#{params[:id]}"
  end
end
