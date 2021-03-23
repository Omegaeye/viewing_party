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

    it "they should see a Brief description of the application" do
      paragraph = "Viewing party is an application to explore movies and create" +
      " a viewing party event for you and your friends to watch a movie together."

      within ".description" do
        expect(page).to have_content(paragraph)
      end
    end

    describe "they should see a Button to Log in" do
      it "And they can login with a correct username and password" do
        user = User.create(username: "funbucket13", password: "test")
        within '.login' do
          fill_in :username, with: user.username
          fill_in :password, with: user.password

          #click_on "Log In"
        end

        #expect(current_path).to eq(dashboard_path(user))

        #expect(page).to have_content("Welcome, #{user.username}")
        #expect(page).to have_link("Log out")
      end
      it "And they cannot login with a wrong passwrord" do
        user = User.create(username: "funbucket13", password: "test")
        within '.login' do
          fill_in :username, with: user.username
          fill_in :password, with: "test123"

          #click_on "Log In"
        end

        #expect(current_path).to eq(root_path)

        #expect(page).to have_content("Invalid password. Please try again")
      end

      it "And they cannot login with a username and password that doesn't exist" do
        within '.login' do
          fill_in :username, with: "fake_user"
          fill_in :password, with: "test"

          #click_on "Log In"
        end

        #expect(current_path).to eq(root_path)

        #expect(page).to have_content("Invalid username and password")
      end
    end

    it "Link to Registration" do
      expect(page).to have_link("New to Viewing Party? Register Here")
      click_link('New to Viewing Party? Register Here')
      #expect(current_path).to eq()
    end
  end
end
