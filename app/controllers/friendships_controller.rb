class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(email: params[:friend].downcase)
    if @friend
      current_user.friendships.find_or_create_by!(
        friend_id: @friend.id
      )
    else
      flash[:error] = 'Invalid Email'
    end
    redirect_to dashboard_path
  end
end
