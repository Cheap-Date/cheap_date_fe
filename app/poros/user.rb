class User
  attr_reader :name, :email, :password

  def initialize(attrs)
    @name = attrs[:name]
    @email = attrs[:email]
    @password = attrs[:password]
  end
end
