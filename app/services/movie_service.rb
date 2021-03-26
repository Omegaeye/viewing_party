class MovieService
  def self.top_rated_movies
    response = connection.get('movie/top_rated?&page=1')
    response2 = connection.get('movie/top_rated?&page=2')

    json1 = JSON.parse(response.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    json1[:results] + json2[:results]
  end

  def self.movies_by_title(movie_title)
    response = connection.get("search/movie?query=#{movie_title}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.movie_by_id(id)
    response = connection.get("movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(movie_id)
    response = connection.get("movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(movie_id)
    response = connection.get("movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org/3/', params: { api_key: ENV['movie_db_api_key'] })
  end
end
