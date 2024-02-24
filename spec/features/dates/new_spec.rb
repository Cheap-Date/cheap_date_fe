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
      expect(page).to have_field(:time)
      expect(page).to have_field(:description)
      expect(page).to have_field(:first_date)

      fill_in :name, with: "Beau Joes"
      fill_in :date, with: "3/12/2023"
      fill_in :time, with: "7:00pm"
      fill_in :description, with: "Pizza date"
      # fill_in :first_date, with: "True"
      expect(page).to have_button("Create Date")

      click_button "Create Date" #as far as I can get right now

      # expect(page).to have_content("Tiger Woods's Dates")
      # expect(page).to have_content("Beau Joes")
    end
  end
end