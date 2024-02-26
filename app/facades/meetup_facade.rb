class MeetupFacade
  def self.create_meetup(name, date, time, description, first_date, id)
    response = MeetupService.create_meetup(name, date, time, description, first_date, id)
    # require 'pry'; binding.pry
  end
end