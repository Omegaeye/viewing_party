require "rails_helper"

RSpec.describe MovieApi do
  it "exists" do
    attrs = {
      id: 1,
      title: "The Dark Knight",
      vote_average: 8.5,
      runtime: 180,
      genres: [1,2,3],
      overview: "This is an overview",
      poster_path: "poster path"
    }

    movie = MovieApi.new(attrs)

    expect(movie).to be_a MovieApi
    expect(movie.id).to eq(attrs[:id])
    expect(movie.title).to eq(attrs[:title])
    expect(movie.vote_average).to eq(attrs[:vote_average])
    expect(movie.duration).to eq(attrs[:runtime])
    expect(movie.genres).to eq(attrs[:genres])
    expect(movie.genres).to be_an(Array)
    expect(movie.overview).to eq(attrs[:overview])
    expect(movie.poster_path).to eq(attrs[:poster_path])
    expect(movie.poster_path).to be_a(String)
  end
end
