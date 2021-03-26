require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many :parties }
  end

  it 'class methods' do
    #
  end

  describe 'instance methods' do
    it '#invites' do
      user_1 = User.create!(
        email: "heckinheck@heckmail.org",
        username: "heckx3",
        password: "heck"
      )
      user_2 = User.create!(
        email: "emailemail@email.com",
        username: "shouldveinstalledfactorybot",
        password: "anotherone"
      )
      user_3 = User.create!(
        email: "lazyhope@example.net",
        password: "passwordpassword",
        username: "anotheruser"
      )
      movie_1 = Movie.create!(
        title: "The Godfather",
        duration: 200,
        api_id: "krahjifq3uyv4i8237gh4mqo9"
      )
      movie_2 = Movie.create!(
        title: "The Godfather, Part II",
        duration: 220,
        api_id: "krahjifoseio458u38237gh4mqo9"
      )
      party_1 = user_2.parties.create!(
        duration: 230,
        movie_id: movie_1.id,
        party_date: Date.today,
        party_time: Time.now
      )
      party_1.party_viewers.create!(viewer_id: user_1.id)
      party_2 = user_3.parties.create(
        duration: 250,
        movie_id: movie_2.id,
        party_date: Date.today,
        party_time: Time.now
      )
      party_2.party_viewers.create(viewer_id: user_1.id)

      expect(user_1.invites).to eq([party_1, party_2])
    end
  end
end
