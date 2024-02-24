require "rails_helper"

RSpec.describe "Edit a User" do
  describe "Happy Path" do
    it "should describe the edit a user page" do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: Faker::Internet.email # Generate a unique email
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
    end
  end
end 