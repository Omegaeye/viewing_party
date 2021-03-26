class MovieApi
  attr_reader :title,
              :vote_average,
              :poster_path

  def initialize(data)
    # title, vote average, duration, genre, summary, cast, reviews
    @movie_service = MovieService.new
    @title = data[:title]
    @vote_average = data[:vote_average]
    @poster_path = data[:poster_path]
    # @duration = data[:duration]
    # @summary = data[:summary]
    # @cast = data[:cast]
  end
end
