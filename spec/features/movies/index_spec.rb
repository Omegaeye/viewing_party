require 'rails_helper'

describe 'As an authenticated user' do
  describe 'when I visit "/movies" I see' do
    before :each do
      visit movies_path
    end
    it "I should see the 40 result to my top rated" do
      expect(page).to have_content("Top Rated Movies:")
      expect(page).to have_content("Life Is Beautiful")
      expect(page).to have_link("Life Is Beautiful")
      expect(page).to have_content("Vote Average:")
    end
  end
end
