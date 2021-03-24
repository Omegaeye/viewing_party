class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: 'User'
  has_many :party_viewers, dependent: :destroy

  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
