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
    @user = current_user
    data = MovieService.movie_by_id(params[:id])
    @movie = MovieApi.new(data)
    @dbmovie = Movie.new
  end

  def create
    new_params = Hash.new
    new_params[:title] = movie_params[:movie_title]
    new_params[:duration] = movie_params[:movie_duration]
    new_params[:api_id] = movie_params[:api_id]
    new_params[:poster_path] = movie_params[:movie_img]
    movie = Movie.create(new_params)
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
    params.permit(:movie_title, :movie_duration, :api_id, :movie_img)
  end
end
