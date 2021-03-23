class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  has_many :friends, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy

  has_secure_password
end
