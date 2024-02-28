require "rails_helper"

RSpec.describe "Edit a Meetup" do
  describe "Happy Path" do

    before :each do
      visit "/login"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      click_button "Log In"
    end

    it "should describe the edit a meetup page", :vcr do
      visit "/users/3/meetups/1/edit"

      expect(page).to have_content("Edit an Existing Date")
      expect(page).to have_field(:title)
      expect(page).to have_field(:location)
      expect(page).to have_field(:start_time)
      expect(page).to have_field(:end_time)
      # expect(page).to have_field(:first_date)
      expect(page).to have_button("Edit This Date")
    end

    it "should edit a meetup and redirect to user's meetup index page", :vcr do
      visit "/users/3/meetups/4/edit"
     
      expect(page).to have_field(:title, with: "Ski Day")
      expect(page).to have_field(:location,  with: "Breck")
      expect(page).to have_field(:start_time)
      expect(page).to have_field(:end_time)
      # expect(page).to have_field(:first_date)
      
      fill_in :title, with: "Pizza making class"
      fill_in :location, with: "pizza shop"
      fill_in :start_time, with: "8:00am"
      fill_in :end_time, with: "1:00pm"

      click_button "Edit This Date"

      expect(current_path).to eq("/users/3/meetups")
      expect(page).to have_content("Pizza making class")
      expect(page).to have_content("pizza shop")
    end
  end

  describe "Sad Path" do
    it "should give an error if not all fields are filled in", :vcr do
      visit "/users/3/meetups/4/edit"
      
      fill_in :title, with: ""
      fill_in :location, with: ""
      fill_in :start_time, with: ""
      fill_in :end_time, with: ""

      click_button "Edit This Date"

      expect(page).to have_content("Please fill in all fields")
      expect(current_path).to eq("/users/3/meetups/4/edit")
    end
  end
end 