class Meetup
  attr_reader :title, :location, :start_time, :end_time, :first_date
  def initialize(meetup)
    @title = meetup["attributes"]["title"]
    @location = meetup["attributes"]["location"]
    @start_time = meetup["attributes"]["start_time"]
    @end_time = meetup["attributes"]["end_time"]
    @first_date = meetup["attributes"]["first_date"]
  end
end