class MovieService

  def get_data
    response = Faraday.get("https://api.themoviedb.org/3")
    data = response.body
    json= JSON.parse(data, symbolize_names: true)
  end

  def title
    
  end

end
