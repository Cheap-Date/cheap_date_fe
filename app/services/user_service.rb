class UserService
  def user_find(id)
    user = get_url("/api/v1/users/#{id}")
    user[:data]
  end

  def all_users
    users = get_url("/api/v1/users")
    users[:data]
  end

  def find_by_email_and_pass(email, password)
    conn.get("/api/v1/find_by_email") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = {email: email, password: password}.to_json
    end
  end

  def update_user(user, name, email, password)
    conn.patch("/api/v1/users/#{user.id}") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { name: name, email: email, password: password }.to_json
    end
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
