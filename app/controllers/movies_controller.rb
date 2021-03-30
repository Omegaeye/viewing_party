class MoviesController < ApplicationController
  def index
    @movies = if params[:top_rated]
                MovieService.top_rated_movies.map do |data|
                  Film.new(data)
                end
              else
                MovieService.movies_by_title(params[:movie_title]).map do |data|
                  Film.new(data)
                end
              end
  end

  def show
    @user = current_user
    data = MovieService.movie_by_id(params[:id])
    @movie = Film.new(data)
    @dbmovie = Movie.new
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
