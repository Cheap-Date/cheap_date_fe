class User
  attr_reader :name, :email, :password

  def initialize(attrs)
    @name = attrs[:attributes][:name]
    @email = attrs[:attributes][:email]
    @password = attrs[:attributes][:password]
  end
end
