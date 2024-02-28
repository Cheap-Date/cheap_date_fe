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
      new_meetup = MeetupFacade.find_meetup_by_id(3, 3)
     
      # expect(page).to have_field(:title, with: "Beau Joes Pizza Date")
      # expect(page).to have_field(:location,  with: "Beau Joes in Idaho Springs, CO")
      # expect(page).to have_field(:start_time)
      # expect(page).to have_field(:end_time)
      # expect(page).to have_field(:first_date)
      
      fill_in :title, with: "#{new_meetup.title}"
      fill_in :location, with: "#{new_meetup.location}"
      fill_in :start_time, with: "#{new_meetup.start_time}"
      fill_in :end_time, with: "#{new_meetup.end_time}"

      click_button "Edit This Date"

      expect(current_path).to eq("/users/3/meetups")
      expect(page).to have_content("#{new_meetup.title}")
      expect(page).to have_content("#{new_meetup.location}")
    end
  end

  describe "Sad Path" do
    it "should give an error if not all fields are filled in", :vcr do
      visit "/users/3/meetups/4/edit"
      new_meetup = MeetupFacade.find_meetup_by_id(3, 3)
      
      fill_in :title, with: ""
      fill_in :location, with: "#{new_meetup.location}"
      fill_in :start_time, with: "#{new_meetup.start_time}"
      fill_in :end_time, with: "#{new_meetup.end_time}"

      click_button "Edit This Date"

      expect(page).to have_content("Please fill in all fields")
      expect(current_path).to eq("/users/3/meetups/4/edit")
    end
  end
end 