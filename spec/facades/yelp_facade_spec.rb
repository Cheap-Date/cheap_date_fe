require "rails_helper"

RSpec.describe YelpFacade do
  describe "instantiation" do
    it "exists" do
      facade = YelpFacade.new

      expect(facade).to be_a(YelpFacade)
    end
  end
end
