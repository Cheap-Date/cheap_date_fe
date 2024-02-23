require "rails_helper"

RSpec.describe UserFacade do
  describe "instantiation" do
    it "exists" do
      facade = UserFacade.new

      expect(facade).to be_a(UserFacade)
    end
  end

  it "returns single user" do
    user = UserFacade.new.user(1)

    expect(user).to be_a(User)
  end
end
