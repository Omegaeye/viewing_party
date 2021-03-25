class DashboardController < ApplicationController
  def index
    @current_user = User.first
  end
end
