require "rails_helper"

RSpec.describe Business do
  it "exists" do
    attrs = { name: "Pop's" }

    business = Business.new(attrs)

    expect(business.name).to eq("Pop's")
  end
end
