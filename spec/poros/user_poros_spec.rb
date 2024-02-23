require "rails_helper"

RSpec.describe User do
  it "exists" do
    attrs = { name: "Jo" }

    user = User.new(attrs)

    expect(user.name).to eq("Jo")
  end
end
