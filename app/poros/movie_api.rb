class MovieApi
  attr_reader :id,
              :title,
              :vote_average,
              :duration,
              :genres,
              :overview
            #  :cast,
            #  :reviews

  def initialize(data)
    # title, vote average, duration, genre, summary, cast, reviews
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @duration = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    #@cast = data[:cast] #credits
  #  @reviews = data[:reviews] #reviews
  end
end
