require "rails_helper"

RSpec.describe "Create Date", type: :feature do
  describe "Create Date" do

    before :each do
      visit "/login"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      click_button "Log In"
    end

    it "should see a form to create a date", :vcr do
      visit "/users/3/dates/new"

      expect(page).to have_content("Create a Date")
      expect(page).to have_field(:title)
      expect(page).to have_field(:location)
      expect(page).to have_field(:start_time)
      expect(page).to have_field(:end_time)
      expect(page).to have_field(:first_date)

      fill_in :title, with: "Beau Joes Pizza Date"
      fill_in :location, with: "Beau Joes in Idaho Springs, CO"
      fill_in :start_time, with: "7:00pm"
      fill_in :end_time, with: "9:00pm"
      # fill_in :first_date, with: "True"
      expect(page).to have_button("Create Date")

      click_button "Create Date" 

      expect(page).to have_content("Tiger Woods's Dates")
      expect(page).to have_content("Beau Joes Pizza Date")
    end

    #Sad Path
    it "should give an error if not all fields are filled in" do
      visit "/users/3/dates/new"

      fill_in :title, with: ""
      fill_in :location, with: "Beau Joes in Idaho Springs, CO"
      fill_in :start_time, with: "7:00pm"
      fill_in :end_time, with: "9:00pm"
      # fill_in :first_date, with: "True"
      expect(page).to have_button("Create Date")

      click_button "Create Date" 

      expect(page).to have_content("Please fill in all fields")

      expect(current_path).to eq("/users/3/dates/new")
    end
  end
end