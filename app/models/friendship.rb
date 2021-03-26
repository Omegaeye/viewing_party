class Friendship < ApplicationRecord
  validates :friend_id, presence: true
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
