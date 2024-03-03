class Event
  attr_reader :id, :name, :location, :description, :start_date,
              :category, :cost, :cost_max, :is_free, :event_url

  def initialize(attrs)
    # attrs has 3 keys: id:string, type:string atttributes:{key:value} pairs
    @id = attrs[:id]
    @type = attrs[:type]
    @name = attrs[:attributes][:name]
    @location = attrs[:attributes][:location]
    @description = attrs[:attributes][:description]
    @category = attrs[:attributes][:category]
    @cost = attrs[:attributes][:cost]
    @cost_max = attrs[:attributes][:cost_max]
    @is_free = attrs[:attributes][:is_free]
    @url = attrs[:attributes][:event_site_url]
  end
end