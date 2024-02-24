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
    end
  end
end 