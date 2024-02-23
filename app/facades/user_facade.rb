class UserFacade
  def user(id)
    service = UserService.new
    response = service.user_find(id)
    user = User.new(response)
  end
end
