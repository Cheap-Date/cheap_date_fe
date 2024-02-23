require "rails_helper"

RSpec.describe "Create a User" do
  it "should desribe the create a user page" do
    visit "/register"

    expect(page).to have_content("Create User Profile")

    fill_in :full_name, with: "Tiger Woods"
    fill_in :email, with: "tiger@gmail.com"
    fill_in :password, with: "golf123"
    fill_in :password_confirmation, with: "golf123"

    click_button "Create Profile"

    expect(current_path).to eq(user_path(User.last.id))
    expect(page).to have_content("Account Created")
  end
end