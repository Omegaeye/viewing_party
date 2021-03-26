require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit "/dashboard" I see' do
    before :each do
      @user = User.create!(username: "sphinx", email: "123fake@email.com", password: "password")
      @user_2 = User.create!(
        email: "friendboy@email.com",
        username: "friendmandude",
        password: "heck"
      )
      @movie = Movie.create!(
        title: "Daybreak",
        duration: 180,
        api_id: "kesjmrv8io2w3ay5n98327nhvaw38ouy3rhju"
      )
      @invite_party = @user_2.parties.create!(
        movie_id: @movie.id,
        duration: 195,
        party_date: Date.today,
        party_time: Time.now
      )
      @invite_party.party_viewers.create!(viewer_id: @user.id)

      visit root_path
      fill_in :username, with: @user.username
      fill_in :password, with: "password"

      click_on "Log In"
    end

    it "'Welcome <username>!' at the top of page" do
      expect(page).to have_content("Welcome #{@user.username}!")
    end

    it "A button to Discover Movies" do
      expect(page).to have_button("Discover Movies")
      click_button("Discover Movies")

      expect(current_path).to eq(discover_path)
    end

    it "A friends section" do
      expect(page).to have_content("Friends:")
    end

    it "A viewing parties section" do
      expect(page).to have_content("Watch Parties:")
      expect(page).to have_content("Invited:")
      page.all('div.parties_for_you').each do |div|
        expect(div).to have_content("Movie:")
        expect(div).to have_content("Duration:")
        expect(div).to have_content("Hosted by:")
        expect(div).to have_content("Date:")
        expect(div).to have_content("Time:")
      end

      expect(page).to have_content("Hosting:")
      page.all('div.parties_you_run').each do |div|
        expect(div).to have_content("Movie:")
        expect(div).to have_content("Duration:")
        expect(div).to have_content("Invitees:")
        expect(div).to have_content("Date:")
        expect(div).to have_content("Time:")
      end
    end
  end
end
