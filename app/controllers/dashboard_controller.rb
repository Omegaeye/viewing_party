class DashboardController < ApplicationController
  def index
    @user = current_user
    # @friends = current_user.friendships
    invited = @user.invites
    hosting = @user.parties
    @parties = {
      invited_to: invited,
      hosted: hosting
    }
    # binding.pry
  end
end
