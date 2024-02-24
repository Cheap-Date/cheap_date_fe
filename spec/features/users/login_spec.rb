require "rails_helper"

RSpec.describe "login page", type: :feature do
  describe "/login" do
    let(:mock_user) { double('User', id: 1, name: "John Doe", email: "john@example.com", password: "oopadoo") }

    it "renders the login page" do
      visit "/"

      expect(page).to have_button("Login")

      click_button "Login"

      expect(current_path).to eq("/login")
    end

    it "has a form for logging in" do
      visit "/login"

      expect(page).to have_content("Log In!")
      expect(page).to have_field("Email:")
      expect(page).to have_field("Password:")
      expect(page).to have_button("Log In")
      expect(page).to have_link("Log In With Google")

      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"

      click_button "Log In"

      expect(current_path).to eq("/users/3")
    end
  end
end
