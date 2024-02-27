require "rails_helper"

RSpec.describe MeetupService do
  describe "instantiation" do
    it "exists" do
      service = MeetupService.new

      expect(service).to be_a(MeetupService)
    end
  end
end