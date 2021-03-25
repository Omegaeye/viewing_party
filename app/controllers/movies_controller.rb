class MoviesController < ApplicationController
  def index
    @movie_service = MovieService.new
    @movies = @movie_service.get_top_rated[:results].map{|data| MovieApi.new(data)}
  end
end
