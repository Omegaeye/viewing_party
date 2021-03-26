require 'rails_helper'

describe 'As an authenticated user' do
  before :each do
    data = MovieService.movie_by_id(24428)
    @movie = MovieApi.new(data)
    #binding.pry
    visit movie_path(@movie.id)
  end
  describe "When I visit the movie's detail page," do
    it "I should see a button to create a viewing party", :vcr do
      within '.viewing-party' do
        expect(page).to have_button('Create Viewing Party for Movie')
        click_button
      end
      expect(current_path).to eq(new_viewing_party_path)
    end
    describe "And I should see the following information about the movie:", :vcr do
      it "Movie title" do
        expect(page).to have_content(@movie.title)
      end
      it "Vote Average of the movie" do
        expect(page).to have_content(@movie.vote_average)
      end
      it "Runtime in hours & minutes" do
        expect(page).to have_content(@movie.duration)
      end
      it "Genere(s) associated to movie" do
        genres = @movie.genres.map {|genre| genre[:name]} if @movie.genres
        expect(page).to have_content(genres.first)
        expect(page).to have_content(genres.last)
      end
      it "Summary description" do
        expect(page).to have_content(@movie.overview)
      end
      it "List the first 10 cast members (characters&actress/actors)" do
        expect(page).to have_content(@movie.cast.first)
      end
      it "Count of total reviews" do
        expect(page).to have_content('19 Reviews')
      end
      it "Each review's author and information" do
        review1 = @movie.reviews.first
        content = review1[0]
        author_info = review1[1]

        #expect(page).to have_content(content)
        #expect(page).to have_content(author_info[:name])
        #expect(page).to have_content(author_info[:rating])
      end
    end
  end
end
