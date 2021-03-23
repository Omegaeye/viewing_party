require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end
  describe "When a user visits the root path" do
    it "they should be on the welcome page" do
      expect(current_path).to eq("/")
    end

    it "they should see a welcome message" do
      expect(page).to have_content("Welcome to Viewing Party")
    end

    it "Brief description of the application" do
      paragraph = "Viewing party is an application to explore movies and create" +
      " a viewing party event for you and your friends to watch a movie together."

      within ".description" do
        expect(page).to have_content(paragraph)
      end
    end

    it "Button to Log in" do
      user = User.create(username: "funbucket13", password: "test")

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      #click_on "Log In"

      #expect(current_path).to eq(root_path)

      #expect(page).to have_content("Welcome, #{user.username}")
    end

    it "Link to Registration" do
      expect(page).to have_link("New to Viewing Party? Register Here")
      click_link('New to Viewing Party? Register Here')
      #expect(current_path).to eq()
    end
  end
end
