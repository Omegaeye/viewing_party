require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe "When a user visits the root path" do
    it "they should be on the welcome page" do
      visit root_path
      expect(current_path).to eq("/")
    end

    it "they should see a welcome message" do
    end

    it "Brief description of the application" do
    end

    it "Button to Log in" do
    end

    it " Link to Registration" do
    end
  end
end
