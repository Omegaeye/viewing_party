class User < ApplicationRecord
<<<<<<< HEAD
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

=======
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  has_many :friends
  has_many :parties, foreign_key: :host_id
>>>>>>> main
  has_secure_password
end
