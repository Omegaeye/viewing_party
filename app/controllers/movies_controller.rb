class MoviesController < ApplicationController
  def index
    movie_service = MovieService.new
    @movies = if params[:top_rated]
                movie_service.top_rated_movies.map { |data| MovieApi.new(data) }
              else
                movie_service.movies_by_title(params[:movie_title])[:results].map { |data| MovieApi.new(data) }
              end
  end
end
