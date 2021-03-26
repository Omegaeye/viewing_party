class MoviesController < ApplicationController
  def index
    @movies = if params[:top_rated]
                MovieService.top_rated_movies.map do |data|
                  MovieApi.new(data)
                end
              else
                MovieService.movies_by_title(params[:movie_title]).map do |data|
                  MovieApi.new(data)
                end
              end
  end
  def show
    data = MovieService.movie_by_id(params[:id])
    @movie = MovieApi.new(data)
  end
end
