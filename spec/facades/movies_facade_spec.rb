require 'rails_helper'

describe MoviesFacade, type: :class do
  describe 'class methods' do
    it 'get_movie_details' do
      json = {
        id: 32156,
        title: "Roast the Coast",
        vote_average: 25,
        runtime: 180,
        genres: ["action", "romance"],
        overview: "A spicy hot take on The Little Mermaid with giant space prawns and hot Venusian atmosphere.",
        poster_path: "www.example-poster.com"
      }
      allow(MovieService).to receive(:movie_by_id).and_return(json)
      film = MoviesFacade.get_movie_details(32156)
      expect(film).to be_a Film
      expect(film.id).to eq(json[:id])
      expect(film.duration).to eq(json[:runtime])
    end
  end
end
