require 'rails_helper'

describe MovieService do
  context "instance methods" do
    context "#top_rated_movies" do
      it "returns movie data for the 40 top rated movies" do
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
      it "returns movie data based on a title" do
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
  end
end
