require 'rails_helper'

describe "Movie Index Page" do
  describe 'As an authenticated user' do
    before :each do
      VCR.use_cassette("top_rated_movies") do
        visit discover_path

        within ".rated" do
          expect(page).to have_button("Find Top Rated Movies")
          click_button
        end
      end
    end
    describe 'when I visit "/movies" I see' do
      it "I should see the 40 result to my top rated" do
          expect(page).to have_content("Movies:")
          expect(page).to have_content("Life Is Beautiful")
          expect(page).to have_link("Life Is Beautiful")
      end
      it "I can click on the movie link and it will take me to the movie show page" do
        VCR.use_cassette("movie_show_page") do
          expect(page).to have_content("Life Is Beautiful")
          click_link "Life Is Beautiful"
          expect(current_path).to eq(movie_path(637))
        end
      end

      describe "Button to Discover top 40 movies" do
        it "When I click the top rated button, it takes me to the movie page" do
            VCR.use_cassette("top_rated_movies") do
            within ".rated" do
              expect(page).to have_button("Find Top Rated Movies")
              click_button
            end
              expect(current_path).to eq(movies_path)
          end
        end
      end

      describe "User can search by movie title" do
        it "I can see a text field to search by movie title with a button" do
          VCR.use_cassette("movies_by_title") do
            within ".title" do
              expect(page).to have_field(:movie_title)
              expect(page).to have_button("Find Movies")
              fill_in :movie_title, with: 'the'
              click_button
              expect(current_path).to eq(movies_path)
            end
          end
        end
        it "I can see a text field to search by movie title with a button" do
          VCR.use_cassette("no-movies-returned") do
            within ".title" do
              expect(page).to have_field(:movie_title)
              expect(page).to have_button("Find Movies")
              fill_in :movie_title, with: 'sdfsdfsdfdhfyh'
              click_button
            end
            expect(current_path).to eq(movies_path)
            expect(page).to have_content("No movies within your search results.")
          end
        end
      end
    end
  end
end
