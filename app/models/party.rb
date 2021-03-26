class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: 'User'
  has_many :party_viewers, dependent: :destroy

  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def viewer_usernames
    usernames = party_viewers.map do |slot|
      slot.viewer.username
    end
    if usernames.count == 0
      "None"
    elsif usernames.count == 1
      usernames.first
    else
      usernames.join(", ")
    end
  end
end
