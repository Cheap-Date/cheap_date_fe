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
      visit "/users/3/meetups/1/edit"
      
      expect(page).to have_field(:title, with: "Beau Joes Pizza Date")
      expect(page).to have_field(:location,  with: "Beau Joes in Idaho Springs, CO")
      expect(page).to have_field(:start_time)
      expect(page).to have_field(:end_time)
      # expect(page).to have_field(:first_date)
      
    end
  end
end 