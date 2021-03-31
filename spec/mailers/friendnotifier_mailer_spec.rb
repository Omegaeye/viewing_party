require 'rails_helper'

RSpec.describe FriendNotifierMailer, type: :mailer do
  describe 'inform' do
    sending_user = User.create!(username: "fakefriend", email: "fakefriend@email.com", password: "password")
    friend = User.create!(email: "friend1@email.com", username: "friend1", password: "password")
    email_info = {
      user: sending_user,
      friend: friend.username
    }

    let(:mail) { FriendNotifierMailer.inform(email_info, friend.email) }

    it 'renders the headers' do
      expect(mail.subject).to eq("#{sending_user.username} Viewing Party Friend Request")
      expect(mail.to).to eq(["#{friend.email}"])
      expect(mail.from).to eq(['friend_request@viewing_party.com'])
      expect(mail.reply_to).to eq(["#{sending_user.email}"])
    end

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include('Hello friend1!')
      expect(mail.text_part.body.to_s).to include("#{sending_user.username} has requested to be your friend on Viewing Party.")

      expect(mail.html_part.body.to_s).to include('Hello friend1!')
      expect(mail.html_part.body.to_s).to include("#{sending_user.username} has requested to be your friend on Viewing Party.")

      expect(mail.body.encoded).to include('Hello friend1!')
      expect(mail.body.encoded).to include("#{sending_user.username} has requested to be your friend on Viewing Party.")
    end
  end
end
