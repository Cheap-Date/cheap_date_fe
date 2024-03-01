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

  def self.update_meetup(update_meetup_params)
    conn = Faraday.new(url: "http://localhost:3000")
    
    conn.patch("/api/v1/users/#{update_meetup_params[:id]}/meetups/#{update_meetup_params[:meetup_id]}") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.params = { title: update_meetup_params[:title], location: update_meetup_params[:location], start_time: update_meetup_params[:start_time], end_time: update_meetup_params[:end_time], id: update_meetup_params[:id], meetup_id: update_meetup_params[:meetup_id]}
    end
  end
end