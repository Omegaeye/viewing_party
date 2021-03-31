class FriendNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @friend = info[:friend]

    mail(
      reply_to: @user.email,
      to: recipient,
      subject: "#{@user.username} Viewing Party Friend Request"
    )
  end
end
