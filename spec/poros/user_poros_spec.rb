require "rails_helper"

RSpec.describe User do
  it "exists" do
    attrs = { name: "Jo", email: "dooa@ooog.gma" }

    user = User.new(attrs)

    expect(user.name).to eq("Jo")
    expect(user.email).to eq("dooa@ooog.gma")
  end
end
