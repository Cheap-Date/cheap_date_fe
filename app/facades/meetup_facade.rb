class MeetupFacade
  def self.create_meetup(title, location, start_time, end_time, first_date, id)
    response = MeetupService.create_meetup(title, location, start_time, end_time, first_date, id)
    # require 'pry'; binding.pry
  end
end