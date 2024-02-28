class MeetupService
  def self.create_meetup(title, location, start_time, end_time, first_date, id)
    conn = Faraday.new(url: "http://localhost:3000")

    request = conn.post("/api/v1/users/#{id}/meetups") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { title: title, location: location, start_time: start_time, end_time: end_time, first_date: first_date, id: id}.to_json
    end
  end

  def self.find_meetup(id)
    conn = Faraday.new(url: "http://localhost:3000")

    request = conn.get("/api/v1/users/#{id}/meetups")
    json = JSON.parse(request.body)
  end

  def self.find_meetup_by_id(id, meetup_id)
    conn = Faraday.new(url: "http://localhost:3000")

    request = conn.get("/api/v1/users/#{id}/meetups/#{meetup_id}")
    json = JSON.parse(request.body)
  end
end