require "rails_helper"

RSpec.describe "user dashboard", type: :feature do
  let(:mock_user) { double('User', id: 1, name: "John Doe", email: "john@example.com", password: "oopadoo") }

  it "shows the users dates" do
    visit "/users/#{mock_user.id}"

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Your Dates:")
  end
end
