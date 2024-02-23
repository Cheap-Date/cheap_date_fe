require "rails_helper"

RSpec.describe UserFacade do
  describe "instantiation" do
    it "exists" do
      facade = UserFacade.new

      expect(facade).to be_a(UserFacade)
    end
  end
end
