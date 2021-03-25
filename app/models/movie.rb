class Movie < ApplicationRecord
  has_many :parties, dependent: :destroy
  has_many :party_viewers, through: :parties, dependent: :destroy
  validates :title, presence: true
  validates :api_id, presence: true
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
