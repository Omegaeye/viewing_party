class MoviesFacade
  def self.get_movie_details(movie_api_id)
    movie_info = MovieService.movie_by_id(movie_api_id)
    Film.new(movie_info)
  end

  def self.search_movies_by_title(search)
    MovieService.movies_by_title(search).map do |data|
      Film.new(data)
    end
  end
end
