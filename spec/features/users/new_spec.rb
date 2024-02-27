require "rails_helper"

RSpec.describe "Create a User" do
  describe "Happy Path" do
    it "should describe the create a user page", :vcr do
      visit "/register"

      expect(page).to have_content("Create User Profile")

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiga@woods.golf" # Generate a unique email
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(page).to have_content("Profile Created")
    end
  end

  describe "Sad Path" do
    it "gives an error if passwords do not match", :vcr do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "wrongpassword"

      click_button "Create Profile"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Passwords do not match")
    end

    it "gives an error if not all fields are filled in", :vcr do
      visit "/register"

      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Please fill in all fields")
    end

    it "gives an error if that email was already taken", :vcr do
      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      visit "/register"

      fill_in :name, with: "Tiger Woods"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      fill_in :password_confirmation, with: "golf123"

      click_button "Create Profile"

      expect(page).to have_content("User could not be created: email has already been taken")
    end
  end
end
