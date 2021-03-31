require 'rails_helper'

describe "Movie Show Page" do
  describe 'As an authenticated user' do
    before :each do
      VCR.use_cassette("show-movie") do
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
    end

    describe "And I should see the following information about the movie:" do
      it "Movie information", :vcr do
        expect(page).to have_content(@movie.title)
        expect(page).to have_content(@movie.vote_average)
        expect(page).to have_content("#{@movie.duration/60} hours " + "#{@movie.duration%60}")
        expect(page).to have_content(@movie.overview)
      end

      it "Genre(s) associated with the movie", :vcr do
        genres = @movie.genres.map {|genre| genre[:name]} if @movie.genres
        expect(page).to have_content(genres.first)
        expect(page).to have_content(genres.last)
      end

      it "List of the first 10 cast members and characters they play", :vcr do
        expect(page).to have_content(@movie.cast.first.name)
        expect(page).to have_content(@movie.cast.first.character)
        expect(page).to have_content(@movie.cast[9].name)
        expect(page).to have_content(@movie.cast[9].character)
      end

      it "Count of reviews and review contents", :vcr do
        expect(page).to have_content("#{@movie.reviews.count} Review(s)")
        review1 = @movie.reviews.first
        expect(page).to have_content(review1.author)
        expect(page).to have_content(review1.content)
      end
    end
  end
end
