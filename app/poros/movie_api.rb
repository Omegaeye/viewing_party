class MovieApi
  attr_reader :id,
              :title,
              :vote_average

  def initialize(data)
    # title, vote average, duration, genre, summary, cast, reviews
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    # @duration = data[:duration]
    # @summary = data[:summary]
    # @cast = data[:cast]
  end
end
