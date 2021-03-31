require 'rails_helper'

describe MovieService do
  context "instance methods" do
    context "#top_rated_movies" do
      it "returns movie data for the 40 top rated movies", :vcr do
        movies = MovieService.top_rated_movies
        expect(movies).to be_a Array
        expect(movies.count).to eq(40)
        movie_data = movies.first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
    context "#movies_by_title" do
      it "returns movie data based on a title", :vcr do
        movies = MovieService.movies_by_title('the')
        expect(movies).to be_a Array
        expect(movies.count).to eq(20)
        movie_data = movies.first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
    context "#movie_by_id" do
      it "returns movie data based on an ID", :vcr do
        movie = MovieService.movie_by_id(24428)
        expect(movie).to be_a Hash

        expect(movie).to have_key :id
        expect(movie[:id]).to be_a(Integer)

        expect(movie).to have_key :title
        expect(movie[:title]).to be_a(String)

        expect(movie).to have_key :vote_average
        expect(movie[:vote_average]).to be_a(Float)

        expect(movie).to have_key :runtime
        expect(movie[:runtime]).to be_a(Integer)

        expect(movie).to have_key :genres
        expect(movie[:genres]).to be_a(Array)

        expect(movie).to have_key :overview
        expect(movie[:overview]).to be_a(String)
      end
    end
    context "#cast" do
      it "returns movie cast based on an ID", :vcr do
        credits = MovieService.cast(24428)
        expect(credits).to be_a Hash

        expect(credits).to have_key :cast
        expect(credits[:cast]).to be_a(Array)

        cast_member = credits[:cast].first
        expect(cast_member).to be_a Hash
        expect(cast_member).to have_key :name
        expect(cast_member).to have_key :character
      end
    end
    context "#reviews" do
      it "returns movie reviews based on an ID", :vcr do
        reviews = MovieService.reviews(24428)
        expect(reviews).to be_a Hash

        expect(reviews).to have_key :results
        expect(reviews[:results]).to be_a(Array)
        result1 = reviews[:results].first

        expect(result1).to be_a Hash
        expect(result1).to have_key :author
        expect(result1).to have_key :author_details
        expect(result1).to have_key :content

        details = result1[:author_details]
        expect(details).to be_a Hash
        expect(details).to have_key :name
        expect(details).to have_key :rating
      end
    end
  end
end
