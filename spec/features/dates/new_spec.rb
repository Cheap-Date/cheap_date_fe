require "rails_helper"

RSpec.describe "Create Date", type: :feature do
  describe "Create Date" do

    before :each do
      visit "/login"
      fill_in :email, with: "tiger@gmail.com"
      fill_in :password, with: "golf123"
      click_button "Log In"
    end

    it "should see a form to create a date" do
      visit "/users/3/dates/new"

      expect(page).to have_content("Create a Date")
      expect(page).to have_field(:name)
      expect(page).to have_field(:date)
      expect(page).to have_field(:description)
      expect(page).to have_field(:type)

      fill_in :name, with: "Beau Joes"
      # fill_in :date, with: ""
      fill_in :description, with: "Pizza date"
      # fill_in :type, with: "first"
      expect(page).to have_button("Create Date")
    end
  end
end