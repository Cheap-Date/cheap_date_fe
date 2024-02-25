require "rails_helper"

RSpec.describe UserService do
  describe "instantiation" do
    it "exists" do
      service = UserService.new

      expect(service).to be_a(UserService)
    end
  end

  it "returns a single user by id" do
    user = UserService.new.user_find(1)

    expect(user).to be_a(Hash)
  end

  it "returns a single user by email" do
    user = UserService.new.all_users

    expect(user).to be_an(Array)
  end

  describe ".find_by_email_and_pass" do
    it "has returns a faraday response" do
      user = UserService.new.find_by_email_and_pass("tiger@gmail.com", "golf123")

      expect(user).to be_a(Faraday::Response)
    end
  end
end
