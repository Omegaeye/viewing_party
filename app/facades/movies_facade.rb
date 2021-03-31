class MoviesFacade
  def self.get_movie_details(movie_api_id)
    MovieService.movie_by_id(movie_api_id)
  end
end
