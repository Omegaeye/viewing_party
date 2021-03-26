class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(email: params[:friend].downcase)
    if @friend
      current_user.friendships.create!(
        friend_id: @friend.id
      )
    else
      flash[:error] = errors.full_messages.to_sentence
    end
    redirect_to dashboard_path
  end
end
