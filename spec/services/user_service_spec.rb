require "rails_helper"

RSpec.describe UserService do
  describe "instantiation" do
    it "exists" do
      service = UserService.new

      expect(service).to be_a(UserService)
    end
  end
end
