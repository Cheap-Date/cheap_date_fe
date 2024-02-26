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
    end

  describe "success" do
    it "has a form for logging in and it works when the username and password are correct", :vcr do
      visit "/login"

      expect(page).to have_content("Log In!")
      expect(page).to have_field("Email:")
      expect(page).to have_field("Password:")
      expect(page).to have_button("Log In")
      expect(page).to have_link("Log In With Google")

      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"

      click_button "Log In"

      expect(current_path).to eq("/users/4")
      expect(page).to have_content("Welcome, Tiger Woods!")
    end
  end

  describe "failure" do
    it "needs a legitimate user email", :vcr do
      visit "/login"

      fill_in :email, with: "tdiger@gmtail.colm"
      fill_in :password, with: "golf123"

      click_button "Log In"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid email or password")
    end
  end
end
