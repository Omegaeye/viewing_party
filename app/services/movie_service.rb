class MovieService

  def get_top_rated
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&page=1")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=62812900bf70170845400c81296d9581&page=2")

    json1 = JSON.parse(response.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    json1[:results] + json2[:results]
  end

  def get_by_title(movie_title)
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=62812900bf70170845400c81296d9581&query=#{movie_title}")

    json = JSON.parse(response.body, symbolize_names: true)
  end


end
