class MoviesController < ApplicationController
  def index
    @movie_service = MovieService.new
    if params[:top_rated]
      @movies = @movie_service.get_top_rated.map{|data| MovieApi.new(data)}
    else
      @movies = @movie_service.get_by_title(params[:movie_title])[:results].map{|data| MovieApi.new(data)}
    end
  end
end
