class EventService
  def event_list_with_zip
    def connect_to_be_for_zip_search
      conn = Faraday.new(url: "http://localhost:3000")
      request = conn.get("/api/v1/events?start_date=#{Time.now.to_i}&limit=25&location=#{zip}&price=1&radius=40000")
      json = JSON.parse(request.body)
    end
  end

  def event_list_with_lat_long
    def connect_to_be_for_lat_long_search
      conn = Faraday.new(url: "http://localhost:3000")
      request = conn.get("/api/v1/events?start_date=#{Time.now.to_i}&limit=25&latitude=#{latitude}&longitude=#{longitude}&price=1&radius=40000")
      json = JSON.parse(request.body)
    end
  end
  
  def find_by_zip(zip, limit=10)
    conn = Faraday.new(url: "http://localhost:3000")
    res = conn.get("/api/v1/events?start_date=#{Time.now.to_i}&limit=25&location=#{zip}&price=1&radius=40000")
    JSON.parse(res.body, symbolize_names: true)
  end
end