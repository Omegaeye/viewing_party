class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: 'User'
  has_many :party_viewers, dependent: :destroy

  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_save :convert_date

  def viewer_usernames
    usernames = party_viewers.map { |slot| slot.viewer.username }
    case usernames.count
    when 0
      'None'
    when 1
      usernames.first
    else
      usernames.join(', ')
    end
  end

  private

  def convert_date
    self.party_date = party_date.to_date if party_date
  end
end
