class MovieApi
  attr_reader :id,
              :title,
              :vote_average,
              :duration,
              :genres,
              :overview,
              :poster_path

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @duration = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @poster_path = data[:poster_path]
  end

  def cast
    @cast ||= MovieService.cast(@id)[:cast][0..10]
  end

  def reviews
    @reviews ||= MovieService.reviews(@id)[:results].each_with_object({}) do |review, hash|
      hash[review[:content]] = review[:author_details]
    end
  end
end
