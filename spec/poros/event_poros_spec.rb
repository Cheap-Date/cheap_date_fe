require "rails_helper"

RSpec.describe Event do
  it "exists" do
    attrs = { name: "Free Show" }

    event = Event.new(attrs)

    expect(event.name).to eq("Free Show")
  end
end
