require "rails_helper"

RSpec.describe MovieApi do
  it "exists" do
    attrs = {
      id: 1,
      title: "The Dark Knight",
      vote_average: 8.5
    }

    movie = MovieApi.new(attrs)

    expect(movie).to be_a MovieApi
    expect(movie.id).to eq(1)
    expect(movie.title).to eq("The Dark Knight")
    expect(movie.vote_average).to eq(8.5)
  end
end
