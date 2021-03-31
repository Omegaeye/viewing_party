class Film
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
    @cast ||= MovieService.cast(@id)[:cast].first(10).map do |member|
      CastMember.new(member)
    end
  end

  def reviews
    @reviews ||= MovieService.reviews(@id)[:results].map do |movie_review|
      Review.new(movie_review)
    end
  end
end
