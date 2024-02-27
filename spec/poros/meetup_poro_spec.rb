require "rails_helper"

RSpec.describe Meetup do
  it "exists" do
    attrs = {"id"=>"1", "type"=>"meetup", "attributes"=>{"title"=>"Beau Joes Pizza Date", "location"=>"Beau Joes in Idaho Springs, CO", "start_time"=>"7:00pm", "end_time"=>"9:00pm", "first_date"=>true}}

    meetup = Meetup.new(attrs)

    expect(meetup.title).to eq("Beau Joes Pizza Date")
    expect(meetup.location).to eq("Beau Joes in Idaho Springs, CO")
    expect(meetup.start_time).to eq("7:00pm")
    expect(meetup.end_time).to eq("9:00pm")
    expect(meetup.first_date).to eq(true)
  end
end