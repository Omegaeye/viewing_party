require 'rails_helper'

RSpec.describe FriendNotifierMailer, type: :mailer do
  describe 'inform' do
    Movie.destroy_all
    sending_user = User.create!(username: "fakefriend", email: "fakefriend@email.com", password: "password")
    friend = User.create!(email: "friend1@email.com", username: "friend1", password: "password")
    movie = Movie.create!(title: "The Mummy", duration: 120, api_id: 90)
    party = movie.parties.create!(movie_id: 1, duration: 120, host_id: sending_user.id, party_date: Date.today, party_time: Time.now)

    email_info = {
      user: sending_user,
      friend: friend.username,
      party_info: party,
      movie: movie
    }

    let(:mail) { FriendNotifierMailer.inform(email_info, friend.email) }

    it 'renders the headers' do
      expect(mail.subject).to eq("#{movie.title} Viewing Party Invite")
      expect(mail.to).to eq(["#{friend.email}"])
      expect(mail.from).to eq(['invite@viewing_party.com'])
      expect(mail.reply_to).to eq(["#{sending_user.email}"])
    end

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include('Hello friend1!')
      expect(mail.text_part.body.to_s).to include("#{sending_user.username} has sent you an invite to #{movie.title} Viewing Party.")
      expect(mail.text_part.body.to_s).to include("Date: #{party.party_date.strftime("%e %b %Y")}")
      expect(mail.text_part.body.to_s).to include("Time: #{party.party_time.strftime("%l:%M %p %Z")}")
      expect(mail.text_part.body.to_s).to include("Duration: #{party.duration/60} hours #{party.duration%60} minutes")

      expect(mail.html_part.body.to_s).to include('Hello friend1!')
      expect(mail.html_part.body.to_s).to include("#{sending_user.username} has sent you an invite to #{movie.title} Viewing Party.")
      expect(mail.text_part.body.to_s).to include("Date: #{party.party_date.strftime("%e %b %Y")}")
      expect(mail.text_part.body.to_s).to include("Time: #{party.party_time.strftime("%l:%M %p %Z")}")
      expect(mail.text_part.body.to_s).to include("Duration: #{party.duration/60} hours #{party.duration%60} minutes")

      expect(mail.body.encoded).to include('Hello friend1!')
      expect(mail.body.encoded).to include("#{sending_user.username} has sent you an invite to #{movie.title} Viewing Party.")
      expect(mail.text_part.body.to_s).to include("Date: #{party.party_date.strftime("%e %b %Y")}")
      expect(mail.text_part.body.to_s).to include("Time: #{party.party_time.strftime("%l:%M %p %Z")}")
      expect(mail.text_part.body.to_s).to include("Duration: #{party.duration/60} hours #{party.duration%60} minutes")
    end
  end
end
