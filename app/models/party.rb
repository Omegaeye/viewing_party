class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  has_many :party_viewers

  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
