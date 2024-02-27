require "rails_helper"

RSpec.describe "Edit a User" do
  describe "Happy Path" do
    it "should describe the edit a user page", :vcr do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "somfedthing@golf.sports" # Generate a unique email
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(page).to have_content("Profile Created")

      click_button "Edit Profile"

      expect(page).to have_content("Editing Tiger Woods's Profile")

      expect(page).to have_field("Name", with: "Tiger Woods")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password Confirmation")
      expect(page).to have_button("Update Profile")

      fill_in :name, with: "Patrick Mahomes"
      fill_in :email, with: "somfedthing@golf.sports" # Generate a unique email
      fill_in :password, with: "football123"
      fill_in :password_confirmation, with: "football123"

      click_button("Update Profile")

      expect(page).to have_content("Profile Updated")
      expect(page).to have_content("Welcome Patrick Mahomes")
    end
  end

  describe "Sad Path" do
    it "should give an error if not all fields are filled in", :vcr do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "somethingpelse@tigers.tiger" # Generate a unique email
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(page).to have_content("Profile Created")

      click_button "Edit Profile"

      expect(page).to have_content("Editing Tiger Woods's Profile")

      expect(page).to have_field("Name", with: "Tiger Woods")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password Confirmation")
      expect(page).to have_button("Update Profile")

      fill_in :name, with: ""

      click_button("Update Profile")

      expect(page).to have_content("Did not successfully update - please fill in all fields.")
    end
  end
end
