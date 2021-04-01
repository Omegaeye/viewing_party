class MoviesController < ApplicationController
  def index
    @movies = if params[:top_rated]
                MoviesFacade.search_top_rated_movies
              elsif params[:movie_title] == ''
                flash[:error] = 'Please type in a movie'
                render :index
              else
                MoviesFacade.search_movies_by_title(params[:movie_title])
              end
  end

  def show
    @movie = MoviesFacade.get_movie_details(params[:id])
    session[:movie] = { api_id: @movie.id,
                        title: @movie.title,
                        duration: @movie.duration,
                        poster_path: @movie.poster_path }
  end
end
