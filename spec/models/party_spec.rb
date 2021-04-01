require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:duration).is_greater_than_or_equal_to(0) }
  end

  describe 'relationships' do
    it { should belong_to :movie }
    it { should belong_to(:host).class_name('User') }
    it { should have_many :party_viewers }
  end

  describe 'instance methods' do
    before :each do
      @user_1 = User.create!(
        email: "heckinheck@heckmail.org",
        username: "heckx3",
        password: "heck"
      )
      @user_2 = User.create!(
        email: "emailemail@email.com",
        username: "shouldveinstalledfactorybot",
        password: "anotherone"
      )
      @user_3 = User.create!(
        email: "lazyhope@example.net",
        password: "passwordpassword",
        username: "anotheruser"
      )
      @movie_1 = Movie.create!(
        title: "The Godfather",
        duration: 200,
        api_id: "krahjifq3uyv4i8237gh4mqo9"
      )
      @party_1 = @user_1.parties.create!(
        duration: 230,
        movie_id: @movie_1.id,
        party_date: Date.today,
        party_time: Time.now
      )
      @party_1.party_viewers.create!(viewer_id: @user_2.id)
      @party_1.party_viewers.create!(viewer_id: @user_3.id)
      @party_2 = @user_1.parties.create(
        duration: 250,
        movie_id: @movie_1.id,
        party_date: Date.today,
        party_time: Time.now
      )
      @party_3 = @user_1.parties.create(
        duration: 270,
        movie_id: @movie_1.id,
        party_date: Date.today,
        party_time: Time.now
      )
      @party_3.party_viewers.create!(viewer_id: @user_2.id)

    end
    it '#viewer_usernames' do
      expect(@party_1.viewer_usernames).to eq("#{@user_2.username}, #{@user_3.username}")
      expect(@party_2.viewer_usernames).to eq("None")
      expect(@party_3.viewer_usernames).to eq(@user_2.username)
    end

    it "date_check_then_create" do
      expect(@user_1.parties.date_check_then_create(duration: 270,
        movie_id: @movie_1.id,
        party_date: Date.today,
        party_time: Time.now).class).to eq(Party)
    end
  end
end
