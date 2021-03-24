require 'rails_helper'

User.destroy_all

describe 'as a visitor' do
  describe 'when I visit "/register"' do
    before :each do
      visit(new_user_path)
    end

    it 'I see a form that asks me for some information' do
      expect(page).to have_field "user[username]"
      expect(page).to have_field "user[email]"
      expect(page).to have_field "user[password]"
      expect(page).to have_field "user[password_confirmation]"
    end

    it 'when I fill out that form, my account is created' do
      fill_in "user[email]", with: "topdog21@example.com"
      fill_in "user[username]", with: "topdog21"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("Account created successfully.")
      expect(current_path).to eq(dashboard_index_path)
    end

    it "does not create a user with mismatched passwords" do
      fill_in "user[email]", with: "topdog23@example.com"
      fill_in "user[username]", with: "topdog23"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password1"
      click_button "Register"

      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end

    it "does not create a user if the username is taken" do
      User.create(email: "wandsalot@example.com", username: "topdog23", password: "password")

      fill_in "user[email]", with: "topdog23@example.com"
      fill_in "user[username]", with: "topdog23"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end

    it "doesn't create a user if the email is taken" do
      User.create(email: "topdog23@example.com", username: "wandsalot", password: "password")

      fill_in "user[email]", with: "topdog23@example.com"
      fill_in "user[username]", with: "topdog23"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end

    it "doesn't create a user if a field isn't filled out" do
      fill_in "user[email]", with: "topdog23@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"
      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end

    it 'it can not tell apart mixed, upper, or lower case emails' do
      User.create(email: "topdog23@example.com", username: "wandsalot", password: "password")

      fill_in "user[email]", with: "TopDog23@Example.Com"
      fill_in "user[username]", with: "topdog23"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end

    it 'it can not tell apart mixed, upper, or lower case usernames' do
      User.create(email: "wandsalot@example.com", username: "topdog23", password: "password")

      fill_in "user[email]", with: "topdog23@example.com"
      fill_in "user[username]", with: "TOPDOG23"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("One or more fields was taken or invalid.")
      expect(page).to have_content("New User Registration")
    end
  end
end
