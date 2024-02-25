require "rails_helper"

RSpec.describe UserFacade do
  describe "instantiation" do
    it "exists" do
      facade = UserFacade.new

      expect(facade).to be_a(UserFacade)
    end
  end

  it "returns single user by id" do
    user = UserFacade.new.user(1)

    expect(user).to be_a(User)
  end

  it "returns a single user by email" do
    user = UserFacade.new.find_by_email("tiger@gmail.com")

    expect(user).to be_a(User)
    expect(user.name).to eq("Tiger Woods")
    expect(user.email).to eq("tiger@gmail.com")
  end

  it "returns user by email and password" do
    user = UserFacade.new.find_by_email_and_password("tiger@gmail.com", "golf123")

    expect(user).to be_a(User)
  end
end
