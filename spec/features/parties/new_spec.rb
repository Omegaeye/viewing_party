require 'rails_helper'

RSpec.describe 'Viewing Party New Page' do
  before :each do
    visit new_viewing_party_path
  end
  describe "As an authenticated user," do
    describe "When I visit the new viewing party page," do
      it "I should see the name of the movie title rendered above a form" do
      end
      it "I see a form to add a new viewing party" do
      end
      it "I see checkboxes next to each friend (if user has friends)" do
      end
    end
  end
end
