require 'rails_helper'

describe Review, type: :class do
  describe 'class methods' do
    it 'initialize' do
      data = {
        author_details: {
          username: "TurboSloth",
          rating: 5
        },
        content: "Great flick! It's amazing what they can do with a camera these days...",
      }

      love_it = Review.new(data)

      expect(love_it.author).to eq("TurboSloth")
      expect(love_it.author).to be_a String
      expect(love_it.content).to eq ("Great flick! It's amazing what they can do with a camera these days...")
      expect(love_it.content).to be_a String
      expect(love_it.rating).to eq(5)
      expect(love_it.rating).to be_an Integer
    end
  end

  describe 'instance methods' do
    # more to come
  end
end
