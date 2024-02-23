require "rails_helper"

RSpec.describe UserService do
  describe "instantiation" do
    it "exists" do
      service = UserService.new

      expect(service).to be_a(UserService)
    end
  end

  it "returns a single user" do
    user = UserService.new.user_find(1)

    expect(user).to be_a(Hash)
  end
end
