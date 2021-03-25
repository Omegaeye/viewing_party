class MoviesController < ApplicationController
  def index
    @movies = if params[:top_rated]
                MovieFacade.top_rated_movies
              else
                MovieFacade.movies_by_title(params[:movie_title])
              end
  end
  def show
    binding.pry
    @movie = MovieFacade.find_movie_by_id(params[:id])
    # movie_service = MovieService.new
    # # data = movie_service.movie_by_id
    # # @movie =
  end
end
