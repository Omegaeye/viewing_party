class DashboardController < ApplicationController
  def index
    invited = current_user.invites
    hosting = current_user.parties
    @parties = {
      invited_to: invited,
      hosted: hosting
    }
  end
end
