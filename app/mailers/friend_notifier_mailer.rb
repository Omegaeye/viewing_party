class FriendNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @friend = info[:friend]
    @party = info[:party_info]
    @movie = info[:movie]

    mail(
      reply_to: @user.email,
      to: recipient,
      subject: "#{@movie.title} Viewing Party Invite"
    )
  end
end
