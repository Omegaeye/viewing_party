class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(email: params[:friend].downcase)
    if @friend
      current_user.friendships.find_or_create_by!(
        friend_id: @friend.id
      )
      send_email(@friend)
    else
      flash[:error] = 'Invalid Email'
    end
    redirect_to dashboard_path
  end

  def send_email(friend)
    recipient = friend.email

    # `email_info` is the information that we want to include in the email message.
    email_info = {
      user: current_user,
      friend: friend.username
    }

    FriendNotifierMailer.inform(email_info, recipient).deliver_now
  end
end
