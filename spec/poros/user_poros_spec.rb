require "rails_helper"

RSpec.describe User do
  it "exists" do
    attrs = {:id=>"1", :type=>"user", :attributes=>{:name=>"Tiger Woods", :email=>"tiger@gmail.com"}}

    user = User.new(attrs)

    expect(user.id).to eq("1")
    expect(user.name).to eq("Tiger Woods")
    expect(user.email).to eq("tiger@gmail.com")
  end
end
