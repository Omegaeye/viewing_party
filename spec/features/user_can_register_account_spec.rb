require 'rails_helper'

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
      fill_in "user[email]", with: "topdog22@example.com"
      fill_in "user[username]", with: "topdog22"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Register"

      expect(page).to have_content("Account created successfully.")
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end
