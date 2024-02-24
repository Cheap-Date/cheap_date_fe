require "rails_helper"

RSpec.describe "user dashboard", type: :feature do
  let(:mock_user) { double('User', id: 1, name: "John Doe", email: "john@example.com", password: "oopadoo") }

  before :each do
    visit "/login"
    fill_in :email, with: "tiger@gmail.com"
    fill_in :password, with: "golf123"
    click_button "Log In"
  end

  it "renders" do
    visit "/users/#{mock_user.id}"

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Your Dates:")
  end

  it "shows a list of dates, and buttons to discover events, foods, add a new date and log out" do
    expect(current_path).to eq("/users/3")
    expect(page).to have_content("Welcome, Tiger Woods!")
    expect(page).to have_button("Add New Date")
    expect(page).to have_button("Discover Events")
    expect(page).to have_button("Discover Foods")
    expect(page).to have_button("Log Out")
    expect(page).to have_content("Your Dates:")
  end

  describe "add new date button" do
    it "navigates to the new date page" do
      expect(current_path).to eq("/users/3")

      click_button("Add New Date")

      expect(current_path).to eq("/users/3/dates/new")
    end
  end

  describe "discover events button" do
    it "navigates to the discover events page" do
      expect(current_path).to eq("/users/3")

      click_button("Discover Events")

      expect(current_path).to eq("/users/3/events/new")
    end
  end

  describe "discover foods button" do
    it "navigates to the discover foods page" do
      expect(current_path).to eq("/users/3")

      click_button("Discover Foods")

      expect(current_path).to eq("/users/3/foods/new")
    end
  end

  describe "log out button" do
    it "navigates to the root page" do
      expect(current_path).to eq("/users/3")

      click_button("Log Out")

      expect(current_path).to eq("/")
      expect(page).to have_content("Goodbye, Tiger Woods, See You Soon, Have a Great Day Until Next Time, Friend!")
      expect(page).to_not have_content("Welcome, Tiger Woods!")
    end
  end
end
