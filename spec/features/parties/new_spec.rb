require 'rails_helper'

describe 'Viewing Party New Page' do
  before :each do
    VCR.use_cassette("new_viewing_party_page") do
      Movie.destroy_all
      data = MovieService.movie_by_id(24428)
      @movie = Film.new(data)
      @highfive = User.create!(username: "highfive", email: "highfive@fake.com", password: "password", id: 100)
      @lowfive = User.create!(username: "lowfive", email: "lowfive@fake.com", password: "password", id: 101)
      @sidefive = User.create!(username: "sidefive", email: "sidefive@fake.com", password: "password", id: 102)
      @nofive = User.create!(username: "nofive", email: "nofive@fake.com", password: "password", id: 103)
      @movie1 = Movie.create!(title: "The Mummy", duration: 120, api_id: 90, id: 1)
      Friendship.create!(user: @highfive, friend: @lowfive, status: 0)
      Friendship.create!(user: @highfive, friend: @sidefive, status: 0)
      Friendship.create!(user: @highfive, friend: @nofive, status: 0)

      visit root_path

      fill_in :username, with: "highfive"
      fill_in :password, with: "password"
      click_button "Log In"
      visit movie_path(@movie.id)
      click_button("Create Viewing Party for Movie")
    end
  end

  it "I should see the name of the movie title rendered above a form" do
      expect(page).to have_content(@movie.title)
  end

  it "I see a form to add a new viewing party" do
    expect(page).to have_field(:duration)
    expect(page).to have_field(:party_date)
    expect(page).to have_field(:party_time)
  end

  it "I see checkboxes next to each friend (if user has friends)" do
    VCR.use_cassette('test') do
      find(:css, "#friends_#{@lowfive.id}")
      find(:css, "#friends_#{@sidefive.id}")
      find(:css, "#friends_#{@nofive.id}")
    end
  end

  describe "I can fill out the form and create a new party" do
    it "I can fill out party form" do

      fill_in :duration, with: 160
      fill_in :party_date, with: Date.tomorrow
      fill_in :party_time, with: Time.now
      find(:css, "#friends_#{@lowfive.id}").set(true)
      find(:css, "#friends_#{@sidefive.id}").set(false)
      find(:css, "#friends_#{@nofive.id}").set(true)
      click_button("Create Party")

      expect(ActionMailer::Base.deliveries.count).to eq(2)
      email = ActionMailer::Base.deliveries.last

      expect(email.subject).to eq('The Avengers Viewing Party Invite')
      expect(email.reply_to).to eq(["#{@highfive.email}"])

      expect(current_path).to eq(dashboard_path)
      within('#watch_parties') do
        expect(page).to have_content("The Avengers Party")
        expect(page).to have_content("Duration: 2 hours 40 minutes")
        expect(page).to have_content("Hosted by: #{@highfive.username}")
        expect(page).to have_content(@lowfive.username)
        expect(page).to_not have_content(@sidefive.username)
        expect(page).to have_content(@nofive.username)
        expect(page).to have_content("Date:")
        expect(page).to have_content("Time:")
      end
    end

    it "I can create a party without friends" do
      fill_in :duration, with: 160
      fill_in :party_date, with: Date.tomorrow
      fill_in :party_time, with: Time.now
      find(:css, "#friends_#{@lowfive.id}").set(false)
      find(:css, "#friends_#{@sidefive.id}").set(false)
      find(:css, "#friends_#{@nofive.id}").set(false)
      click_button("Create Party")

      expect(ActionMailer::Base.deliveries.count).to eq(0)

      expect(current_path).to eq(dashboard_path)
      within('#watch_parties') do
        expect(page).to have_content("The Avengers Party")
        expect(page).to have_content("Duration: 2 hours 40 minutes")
        expect(page).to have_content("Hosted by: #{@highfive.username}")
        expect(page).to_not have_content(@lowfive.username)
        expect(page).to_not have_content(@sidefive.username)
        expect(page).to_not have_content(@nofive.username)
        expect(page).to have_content("Date:")
        expect(page).to have_content("Time:")
      end
    end

    it "I can't create a party without filling out informations" do
      fill_in :duration, with: ''
      fill_in :party_date, with: ''
      fill_in :party_time, with: ''
      find(:css, "#friends_#{@lowfive.id}").set(false)
      find(:css, "#friends_#{@sidefive.id}").set(false)
      find(:css, "#friends_#{@nofive.id}").set(false)
      click_button("Create Party")
      expect(page).to have_content("Party can't be created, you're missing some information.")
    end

    it "I can't create a party date before tomorrow" do
      fill_in :duration, with: 120
      fill_in :party_date, with: Date.today
      fill_in :party_time, with: Time.now
      find(:css, "#friends_#{@lowfive.id}").set(false)
      find(:css, "#friends_#{@sidefive.id}").set(false)
      find(:css, "#friends_#{@nofive.id}").set(false)
      click_button("Create Party")
      expect(page).to have_content("Party can't be created, you're missing some information.")
    end
  end
end
