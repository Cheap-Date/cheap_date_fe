require "rails_helper"

RSpec.describe "user dates index", type: :feature do
  describe "the stuff it do" do

    before :each do
      visit "/login"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      click_button "Log In"
    end

    it "show the user name and a list of their dates, it do", :vcr do
      visit "/users/3/meetups"

      expect(current_path).to eq("/users/3/meetups")
      expect(page).to have_content("Tiger Woods's Dates")
    end

    it "has a button to edit each date, it do", :vcr do# need date object to implement 100%
      visit "/users/3/meetups"

      expect(page).to have_button("Edit Date")
    end

    it "has a button to create a date, it do", :vcr do
      visit "/users/3/meetups"

      expect(page).to have_button("Create Date")
    end
  end
end
