class MovieFacade
  def self.top_rated_movies
    MovieService.top_rated_movies.map do |data|
      MovieApi.new(data)
    end
  end
  def self.movies_by_title(title)
    MovieService.movies_by_title(title).map do |data|
      MovieApi.new(data)
    end
  end
end
