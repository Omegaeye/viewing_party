class MoviesController < ApplicationController
  def index
    @movies = if params[:top_rated]
                MoviesFacade.search_top_rated_movies
              else
                MoviesFacade.search_movies_by_title(params[:movie_title])
              end
  end

  def show
    @movie = MoviesFacade.get_movie_details(params[:id])
  end

  def create
    movie = Movie.create(movie_params)
    if movie.save
      flash[:success] = "Please fill out the folowing form to create a party for #{movie.title}"
      redirect_to new_movie_viewing_party_path(movie)
    else
      flash[:error] = movie.errors.full_messages.to_sentence
      render [movie]
    end
  end

  private

  def movie_params
    params.permit(:title, :duration, :api_id, :poster_path)
  end
end
