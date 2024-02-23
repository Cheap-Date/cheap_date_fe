require "rails_helper"

RSpec.describe "Create a User" do
  describe "Happy Path" do
    it "should desribe the create a user page" do
      visit "/register"

      expect(page).to have_content("Create User Profile")

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Profile Created")
    end
  end

  describe "Sad Path" do
    it "gives an error if passwords do not match" do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "wrongpassword"

      click_button "Create Profile"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Password does not match") 
    end
  end
end