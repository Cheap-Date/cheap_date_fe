class EventFacade
  def get_events_with_zip(zip)
    service = EventService.new.get_events_with_zip(zip)
  end

  def get_events_with_lat_long(lat, long)
    service = EventService.new.get_events_with_lat_long(lat, long)
  end
  
  def events_by_zip(zip)
    service = EventService.new
    call = service.find_by_zip(zip)
    # event_poros = create_event_poros(call)
  end
  
  def events_by_city_state(city_state)
    service = EventService.new
    call = service.find_by_city_state(city_state)
  end
end