class Event
  attr_reader :name

  def initialize(attrs)
    @name = attrs[:name]
  end
end
