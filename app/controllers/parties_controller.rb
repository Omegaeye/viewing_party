class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    new_params = party_params
    new_params[:party_date] = party_params[:party_date].to_date
    new_params[:party_time] = Time.zone.parse(party_params[:party_time])
    @movie = Movie.find(params[:movie_id])
    party = @movie.parties.create!(new_params)
    if party.save
      PartyViewer.create_multiple_viewers(params[:friends], party.id)
      flash[:success] = "Party Created"
      redirect_to dashboard_path
    else
      flash[:alert] = party.errors.full_messages.to_sentence
      render :new
    end
  end

  private
    def party_params
        params.permit(:duration, :party_date, :party_time, :host_id)
    end
end
