require 'rails_helper'

describe 'Viewing Party New Page' do
  before :each do
    data = MovieService.movie_by_id(24428)
    @movie = MovieApi.new(data)
    @highfive = User.create!(username: "highfive", email: "highfive@fake.com", password: "password", id: 100)
    @lowfive = User.create!(username: "lowfive", email: "lowfive@fake.com", password: "password", id: 101)
    @sidefive = User.create!(username: "sidefive", email: "sidefive@fake.com", password: "password", id: 102)
    @nofive = User.create!(username: "nofive", email: "nofive@fake.com", password: "password", id: 103)
    @movie1 = Movie.create!(title: "The Mummy", duration: 120, api_id: 90, id: 1)
    Friendship.create!(user: @highfive, friend: @lowfive, status: 0)
    Friendship.create!(user: @highfive, friend: @sidefive, status: 0)
    Friendship.create!(user: @highfive, friend: @nofive, status: 0)

    visit root_path

    fill_in :username, with: "highfive"
    fill_in :password, with: "password"
    click_button "Log In"
    visit movie_path(@movie.id)
    click_button("Create Viewing Party for Movie")
  end

  it "I should see the name of the movie title rendered above a form", :vcr do
    expect(page).to have_content(@movie.title)
  end

  it "I see a form to add a new viewing party", :vcr do
    expect(page).to have_field(:duration)
    expect(page).to have_field(:party_date)
    expect(page).to have_field(:party_time)
  end

  it "I see checkboxes next to each friend (if user has friends)", :vcr do
    find(:css, "#friend-#{@lowfive.id}").set(true)
    find(:css, "#friend-#{@sidefive.id}").set(false)
    find(:css, "#friend-#{@nofive.id}").set(true)
  end

  describe "I can fill out the form and create a new party" do
    it "I can fill out party form", :vcr do

      fill_in :duration, with: 160
      fill_in :party_date, with: Date.today
      fill_in :party_time, with: Time.now
      click_button("Create Party")
    end
  end
end
