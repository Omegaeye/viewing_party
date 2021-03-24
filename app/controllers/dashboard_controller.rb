class DashboardController < ApplicationController
  def index
    @user = User.first
  end
end
