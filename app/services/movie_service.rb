class MovieService
  def self.top_rated_movies
    response = conn.get('movie/top_rated?&page=1')
    response2 = conn.get('movie/top_rated?&page=2')

    json1 = JSON.parse(response.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    json1[:results] + json2[:results]
  end

  def self.movies_by_title(movie_title)
    response = conn.get("search/movie?query=#{movie_title}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.movie_by_id(id)
    response = conn.get("movie/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast(movie_id)
    response = conn.get("movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
    # combine this and reviews
  end

  def self.reviews(movie_id)
    response = conn.get("movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org/3/', params: { api_key: ENV['movie_db_api_key'] })
  end
end
