require 'rails_helper'

describe 'As an authenticated user' do
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
  end
  describe "When I visit the movie's detail page," do
    it "I should see a button to create a viewing party", :vcr do
      within '.viewing-party' do
        expect(page).to have_button('Create Viewing Party for Movie')
        click_button
      end
      # expect(current_path).to eq(new_movie_viewing_party_path(@movie))
    end
    describe "And I should see the following information about the movie:" do
      it "Movie title", :vcr do
        expect(page).to have_content(@movie.title)
      end
      it "Vote Average of the movie", :vcr do
        expect(page).to have_content(@movie.vote_average)
      end
      it "Runtime in hours & minutes", :vcr do
        expect(page).to have_content("#{@movie.duration/60} hours " + "#{@movie.duration%60} minutes")
      end
      it "Genere(s) associated to movie", :vcr do
        genres = @movie.genres.map {|genre| genre[:name]} if @movie.genres
        expect(page).to have_content(genres.first)
        expect(page).to have_content(genres.last)
      end
      it "Summary description", :vcr do
        expect(page).to have_content(@movie.overview)
      end
      it "List the first 10 cast members (characters&actress/actors)", :vcr do
        expect(page).to have_content(@movie.cast.first[0])
        expect(page).to have_content(@movie.cast.first[1])
      end
      it "Count of total reviews", :vcr do
        expect(page).to have_content('19 Review(s)')
      end
      it "Each review's author and information", :vcr do
        review1 = @movie.reviews.first
        content = review1[0]
        author_info = review1[1]
        expect(page).to have_content(author_info[:username])
      end
    end
  end
end
