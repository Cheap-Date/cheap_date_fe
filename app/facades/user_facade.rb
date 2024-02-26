class UserFacade
  def user(id)
    service = UserService.new
    response = service.user_find(id)
    user = User.new(response)
    # require 'pry'; binding.pry
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

  def find_by_email_and_password(email, password)
    service = UserService.new
    response = service.find_by_email_and_pass(email, password)
    data = JSON.parse(response.body, symbolize_names: true)
    if data[:status] == 404
      nil
    else
      User.new(data[:data])
    end
  end

  def update_user(user, name, email, password)
    response = UserService.new.update_user(user, name, email, password)
  end
end
