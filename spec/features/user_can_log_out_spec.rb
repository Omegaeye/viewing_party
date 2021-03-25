require 'rails_helper'

describe "after logging in" do
  it "the user can log out" do
    user = User.create(
      username: "brannigan",
      password: "password",
      email: "zapmebaby25@example.com"
    )
    visit root_path
    expect(page).to_not have_content("Logged in as: #{user.username}")

    fill_in :username, with: user.username
    fill_in :password, with: "password"
    click_button "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as: #{user.username}")

    click_link "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Logged in as: #{user.username}")
  end
end
