class UsersController < ApplicationController
  def login_form

  end

  def login_user

  end

  def new
    
  end

  def create
    if params[:password] != params[:password_confirmation]
      flash[:error] = "Passwords do not match"
      redirect_to "/register"
    end
    # require 'pry'; binding.pry

    # conn = Faraday.new(url: "http://localhost:3000") do |faraday|
    #   faraday.headers["Content-Type"] = "application/json"
    #   faraday.headers = { name: params[:name], email: params[:email], password: params[:password]}
    # end
    # response = conn.post("/api/v1/users")
    # json = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end
