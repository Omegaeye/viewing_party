class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  has_many :friends, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy
  has_secure_password

  before_save :downcase_email,
              :downcase_username

  private

  def downcase_email
    email = email.downcase if email
  end

  def downcase_username
    username = username.downcase if username
  end
end
