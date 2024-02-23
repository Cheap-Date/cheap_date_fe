class UsersController < ApplicationController
  def login_form

  end

  def new

  end

  def create
    conn = Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers = { name: params[:full_name], email: params[:email], password: params[:password]}
    end
    response = conn.post("/api/v1/users")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end