class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
    @user = current_user
    @movie = Movie.find(1)
  end

  def create; end
end
