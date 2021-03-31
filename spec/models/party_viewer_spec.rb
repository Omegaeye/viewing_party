require 'rails_helper'

RSpec.describe PartyViewer, type: :model do
  before :each do
    Movie.destroy_all
    @highfive = User.create!(username: "highfive", email: "highfive@fake.com", password: "password", id: 100)
    @lowfive = User.create!(username: "lowfive", email: "lowfive@fake.com", password: "password", id: 101)
    @sidefive = User.create!(username: "sidefive", email: "sidefive@fake.com", password: "password", id: 102)
    @nofive = User.create!(username: "nofive", email: "nofive@fake.com", password: "password", id: 103)
    @movie1 = Movie.create!(title: "The Mummy", duration: 120, api_id: 90, id: 1)
    @party1 = @movie1.parties.create!(movie_id: 1, duration: 120, host_id: 100, party_date: Date.today, party_time: Time.now)
    Friendship.create!(user: @highfive, friend: @lowfive, status: 0)
    Friendship.create!(user: @highfive, friend: @sidefive, status: 0)
    Friendship.create!(user: @highfive, friend: @nofive, status: 0)
  end
  describe 'validations' do
  end

  describe 'relationships' do
    it { should belong_to :party }
    it { should belong_to(:viewer).class_name('User') }
  end
end
