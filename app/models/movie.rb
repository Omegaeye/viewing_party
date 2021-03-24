class Movie < ApplicationRecord
  has_many :parties
  has_many :party_viewers, through: :parties

  validates_presence_of :title
  validates_presence_of :api_id
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
