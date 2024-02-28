class MeetupFacade
  def self.create_meetup(title, location, start_time, end_time, first_date, id)
    response = MeetupService.create_meetup(title, location, start_time, end_time, first_date, id)
  end

  def self.find_meetup(id)
    response = MeetupService.find_meetup(id)
    response["data"].map do |meetup|
      Meetup.new(meetup)
    end
  end

  def self.find_meetup_by_id(id, meetup_id)
    response = MeetupService.find_meetup_by_id(id, meetup_id)
    Meetup.new(response["data"]) if response["data"]
  end
  
  def self.update_meetup(update_meetup_params)
    response = MeetupService.update_meetup(update_meetup_params)
    # require 'pry'; binding.pry
    # Meetup.new(response["data"]) if response["data"]
  end
end