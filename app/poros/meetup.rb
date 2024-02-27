class Meetup
  attr_reader :id, :title, :location, :start_time, :end_time, :first_date
  def initialize(meetup)
    @id = meetup["id"]
    @title = meetup["attributes"]["title"]
    @location = meetup["attributes"]["location"]
    @start_time = meetup["attributes"]["start_time"]
    @end_time = meetup["attributes"]["end_time"]
    @first_date = meetup["attributes"]["first_date"]
  end
end