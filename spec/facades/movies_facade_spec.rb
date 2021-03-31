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

    it 'search_movies_by_title' do
      json = [{
        id: 65465,
        title: "dslkfjh",
        vote_average: 9.3,
        duration: 180,
        genres: ["action", "romance"],
        overview: "it's a movie",
        poster_path: "example.com"
      },
      {
        id: 63543,
        title: "ds,kfgljvh",
        vote_average: 7.5,
        duration: 65,
        genres: ["action", "romance"],
        overview: "sdlkgfujheskjhfgkb",
        poster_path: "dslkgjhesrdk"
        }]
      allow(MovieService).to receive(:movies_by_title).and_return(json)
      method = MoviesFacade.search_movies_by_title("ds")
      expect(method).to be_an Array
      expect(method[0]).to be_a Film
      expect(method[1]).to be_a Film
      expect(method[0].id).to eq(65465)
      expect(method[1].id).to eq(63543)
      expect(method[2]).to be_nil
      expect(method.count).to eq(2)
    end
  end
end
