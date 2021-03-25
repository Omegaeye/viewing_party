class MovieService

  def get_top_rated
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&language=en-US&page=1")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&language=en-US&page=2")

    json1 = JSON.parse(response.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    json1[:results] + json2[:results]
  end

  
end
