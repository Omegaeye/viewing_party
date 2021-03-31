require 'rails_helper'

describe CastMember, type: :class do
  describe 'class methods' do
    it 'initialize' do
      data = {
        name: "Derek Strauss",
        character: "Evan Hollywreath",
        profile_path: "somewebsite.com"
      }

      cast = CastMember.new(data)

      expect(cast.name).to be_a String
      expect(cast.name).to eq "Derek Strauss"
      expect(cast.character).to be_a String
      expect(cast.character).to eq "Evan Hollywreath"
      expect(cast.profile_path).to eq "somewebsite.com"
      expect(cast.profile_path).to be_a String
    end
  end
end
