class MovieApi

  attr_reader :title,
              :vote_average

  def initialize(data)
    #title, vote average, duration, genre, summary, cast, reviews
    @movie_service = MovieService.new
     @title = data[:title]
     @vote_average = data[:vote_average]
     # @duration = data[:duration]
     # @summary = data[:summary]
     # @cast = data[:cast]
  end

  def movie_title
    @movie_service.get_data[:results].map{|r| r[:title]}
  end

end
