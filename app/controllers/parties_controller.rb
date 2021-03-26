class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
    @user = current_user
    @movie = Movie.find(1)
  end

  def create
    require "pry"; binding.pry
    current_user.parties.create(party_params)
    @friend = User.find_by(username: params[:friend].downcase)
    if party.save

    else

    end
  end

  private
    def party_params
        params.require(:party).permit(:duration, :party_date, :party_time)
    end
end
