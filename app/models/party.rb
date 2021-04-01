class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host, class_name: 'User'
  has_many :party_viewers, dependent: :destroy

  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :party_date, presence: true

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

  def self.date_check_then_create(data)
    if data[:party_date] == '' || data[:party_date].to_date < Date.tomorrow
      data[:party_date] = ''
    else
      data[:party_date]
    end
    create(data)
  end

  private

  def convert_date
    self.party_date = party_date.to_date if party_date
  end
end
