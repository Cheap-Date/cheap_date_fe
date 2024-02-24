class User
  attr_reader :id, :name, :email, :password

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:attributes][:name]
    @email = attrs[:attributes][:email]
    @password = attrs[:attributes][:password]
  end
end
