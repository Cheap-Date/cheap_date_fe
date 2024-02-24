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
    user = UserFacade.new.find_by_email("g@goo.com")

    expect(user).to be_a(User)
    expect(user.name).to eq("bob")
    expect(user.email).to eq("g@goo.com")
  end
end
