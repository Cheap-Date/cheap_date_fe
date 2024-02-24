class UserFacade
  def user(id)
    service = UserService.new
    response = service.user_find(id)
    user = User.new(response)
  end

  def find_by_email(email)
    service = UserService.new
    response = service.all_users
    data = response.find { |u| u[:attributes][:email] == email }
    if data
      User.new(data)
    else
      nil
    end
  end

  def update_user(user, name, email, password)
    response = UserService.new.update_user(user, name, email, password)
    # response_body = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end
