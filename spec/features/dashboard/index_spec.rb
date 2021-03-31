require 'rails_helper'
describe "Dashboard Page" do
  describe 'As an authenticated user' do
    describe 'when I visit "/dashboard" I see' do
      before :each do
        Movie.destroy_all
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
        @movie2 = Movie.create!(
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
        @invite_party2 = @user.parties.create!(
          movie_id: @movie2.id,
          duration: 195,
          party_date: Date.new(2021, 05, 02),
          party_time: Time.new(2021, 05, 02, 2, 2, 2)
        )
        @invite_party.party_viewers.create!(viewer_id: @user.id)
        visit root_path
        fill_in :username, with: @user.username
        fill_in :password, with: "password"

        click_on "Log In"
      end

      it "'Welcome <username>!' at the top of page" do
        expect(page).to have_content("Welcome, #{@user.username}!")
      end

      it "A button to Discover Movies" do
        expect(page).to have_button("Discover Movies")
        find("#discover").click
        expect(current_path).to eq(discover_path)
      end

      describe "friends section" do
        it "tells me I have no friends" do
          expect(page).to have_button("Friends Menu")
          click_button("Friends Menu")
          expect(page).to have_content("You currently have no friends.")
        end

        it "gives me the option to add friends" do
          within('div#add_friend') do
            expect(page).to have_content("Add a friend:")
            expect(page).to have_content("Search by email:")
            fill_in(:friend, with: @user_2.email)
            click_button("Add Friend")
          end

          within('div#friends_list') do
            expect(page).to have_content(@user_2.username.capitalize)
          end

        end
        it "gives me an error when trying to add a friend email that doesn't exist" do
          within('div#add_friend') do
            expect(page).to have_content("Add a friend:")
            expect(page).to have_content("Search by email:")
            fill_in(:friend, with: 'test_email@gmail.com')
            click_button("Add Friend")
          end
          expect(page).to have_content('Invalid Email')
        end
      end

    it "A viewing parties section" do
      expect(page).to have_content("Watch Parties:")
      expect(page).to have_content("Invited:")
      page.all('div.col-3 parties_for_you').each do |div|
        expect(div).to have_content("Duration: 3 hours 15 minutes")
        expect(div).to have_content("Hosted by: #{@user_2.username}")
        expect(div).to have_content("Invitees: sphinx")
        expect(div).to have_content("Date:")
        expect(div).to have_content("Time:")
      end

        expect(page).to have_content("Hosting:")
        page.all('div.col-3 parties_you_run').each do |div|
          expect(page).to have_content("Daybreak Party")
          expect(div).to have_content("Duration: 3 hours 15 minutes")
          expect(div).to have_content("Hosted by: #{@user.username}")
          expect(div).to have_content("Invitees: None")
          expect(div).to have_content("Date:")
          expect(div).to have_content("Time:")
        end
      end
    end
  end
end
