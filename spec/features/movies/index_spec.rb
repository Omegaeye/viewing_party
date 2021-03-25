require 'rails_helper'

describe 'As an authenticated user' do
  before :each do
    visit discover_path
    within ".rated" do
      expect(page).to have_button("Find Top Rated Movies")
      click_button
    end
  end
  describe 'when I visit "/movies" I see' do
    it "I should see the 40 result to my top rated" do
      expect(page).to have_content("Top Rated Movies:")
      expect(page).to have_content("Life Is Beautiful")
      expect(page).to have_link("Life Is Beautiful")
      expect(page).to have_content("Vote Average:")
      expect(page).to have_content(8.5)
      page.all('table#movie tr').count.should == 40
    end

    describe "Button to Discover top 40 movies" do
      it "When I click the top rated button, it takes me to the movie page" do
        within ".rated" do
          expect(page).to have_button("Find Top Rated Movies")
          click_button
        end
          expect(current_path).to eq(movies_path)
          page.all('table#movie tr').count.should == 40
      end
    end

    describe "User can search by movie title " do
      it "I can see a text field to search by movie title with a button" do
        within ".title" do
          expect(page).to have_field(:movie_title)
          expect(page).to have_button("Find Movies")
          fill_in :movie_title, with: 'the'
          click_button
          expect(current_path).to eq(movies_path)
          #page.all('table#movie tr').count.should == 40
        end
      end
    end
  end
end
