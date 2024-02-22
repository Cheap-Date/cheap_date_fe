require "rails_helper"

RSpec.describe "Landing Page" do
  it "should desribe the landing page" do
    visit "/"
    
    expect(page).to have_content("Welcome to Cheap Date")
    expect(page).to have_button("Login")
    expect(page).to have_button("Create a User")

    click_button "Login"

    # expect(current_path).to eq("/login")
    expect(current_path).to eq(login_path)

    visit "/"

    click_button "Create a User"

    # expect(current_path).to eq("/register")
    expect(current_path).to eq(register_path)
  end
end