class UserService
  def user_find(id)
    user = get_url("/api/v1/users/#{id}")
    user[:data]
  end

  def all_users
    users = get_url("/api/v1/users")
    users[:data]
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:3000")
  end
end
