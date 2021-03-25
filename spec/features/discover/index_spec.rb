require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit "/discover" I see' do
    before :each do
      visit discover_path
    end

    describe "Button to Discover top 40 movies" do
      it "When I click the top rated button, it takes me to the movie page" do
        within ".rated" do
          expect(page).to have_button("Find Top Rated Movies")
          click_button
        end
          expect(current_path).to eq(movies_path)
      end
    end

    describe "User can search by movie title " do
      it "I can see a text field to search by movie title with a button" do
        within ".title" do
          expect(page).to have_field(:movie_title)
          fill_in :movie_title, with: 'the'
          expect(page).to have_button("Find Movies")
          click_button
          expect(current_path).to eq(movies_path)
        end
      end
    end
  end
end
