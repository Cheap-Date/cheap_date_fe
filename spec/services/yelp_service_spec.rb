require "rails_helper"

RSpec.describe YelpService do
  describe "instantiation" do
    it "exists" do
      service = YelpService.new

      expect(service).to be_a(YelpService)
    end
  end
end
