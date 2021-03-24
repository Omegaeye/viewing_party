require 'rails_helper'

describe "after logging in" do
  it "the user can log out" do
    allow(current_user)
    visit root_path
    click_link "Log Out"
  end
end
