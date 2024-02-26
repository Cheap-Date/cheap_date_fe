class MeetupService
  def self.create_meetup(name, date, time, description, first_date, id)
    conn = Faraday.new(url: "http://localhost:3000")

    request = conn.post("/api/v1/users/#{id}/meetups") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { name: name, date: date, time: time, description: description, first_date: first_date, id: id}.to_json
    end
  end
end