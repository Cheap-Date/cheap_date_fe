class User
  attr_reader :name, :email

  def initialize(attrs)
    @name = attrs[:name]
    @email = attrs[:email]
  end
end
