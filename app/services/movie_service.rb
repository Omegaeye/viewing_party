class MovieService

  def get_top_rated
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&language=en-US&page=1")
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&language=en-US&page=2")
    data = response.body
    json = JSON.parse(data, symbolize_names: true)
  end

  def title

  end

end
