require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  before :each do
    @highfive = User.create!(username: "highfive", email: "highfive@fake.com", password: "password", id: 100)
    @lowfive = User.create!(username: "lowfive", email: "lowfive@fake.com", password: "password", id: 101)
    @sidefive = User.create!(username: "sidefive", email: "sidefive@fake.com", password: "password", id: 102)
    @nofive = User.create!(username: "nofive", email: "nofive@fake.com", password: "password", id: 103)
    @movie = Movie.create!(title: "The Mummy", duration: 120, api_id: 90, id: 1)
    Friendship.create!(user: @highfive, friend: @lowfive, status: 0)
    Friendship.create!(user: @highfive, friend: @sidefive, status: 0)
    Friendship.create!(user: @highfive, friend: @nofive, status: 0)

    visit root_path

    fill_in :username, with: "highfive"
    fill_in :password, with: "password"
    click_button "Log In"

    visit new_viewing_party_path
  end
  describe "As an authenticated user," do
    describe "When I visit the new viewing party page," do
      it "I should see the name of the movie title rendered above a form" do
        expect(page).to have_content(@movie.title)
      end

      it "I see a form to add a new viewing party" do
        expect(page).to have_field(:duration)
        expect(page).to have_field(:date)
        expect(page).to have_field(:time)
      end

      it "I see checkboxes next to each friend (if user has friends)" do
        # expect(page).to have_field(:friends)
      end
    end

    describe "I can fill out the form and create a new party" do
      it "I can fill out party form" do

        fill_in :duration, with: 160
        fill_in :date, with: "03/31/2021"
        fill_in :time, with: "12:30 PM"
        save_and_open_page
        find(:css, "#friend-#{@lowfive.username}").set(true)
        find(:css, "#friend-#{@sidefive.username}").set(false)
        find(:css, "#friend-#{@nofive.username}").set(true)
        click_button("Create Party")
      end
    end
  end
end
