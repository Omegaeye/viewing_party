require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit "/dashboard" I see' do
    before :each do
      @user = User.create!(username: "sphinx", email: "123fake@email.com", password: "password")
      visit root_path
      within '.login-form' do
        fill_in :username, with: @user.username
        fill_in :password, with: @user.password

        click_on "Log In"
      end
      visit dashboard_path
    end

    it "'Welcome <username>!' at the top of page" do
      expect(page).to have_content("Welcome #{@user.username}!")
    end

    it "A button to Discover Movies" do
      expect(page).to have_button("Discover Movies")
      click_button("Discover Movies")

      expect(current_path).to eq(discover_path)
    end

    it "A friends section" do
      expect(page).to have_content("Friends:")
    end

    it "A viewing parties section" do
      expect(page).to have_content("Parties:")
    end
  end
end
