class PartiesController < ApplicationController
  before_action :movie, only: %i[new create]
  def new
    @viewing_party = Party.new
  end

  def create
    party = @movie.parties.create!(new_params)
    if party.save
       pv = PartyViewer.create_multiple_viewers(params[:friends], party.id)
        if pv
          flash[:success] = 'Party Viewer Created'
        else
          flash[:error] = pv.errors.full_messages.to_sentence
          render :new
        end
      flash[:success] = 'Party Created'
      redirect_to dashboard_path
    else
      flash[:alert] = party.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def new_params
    new_params = party_params
    new_params[:party_date] = party_params[:party_date].to_date
    new_params[:party_time] = Time.zone.parse(party_params[:party_time])
    new_params
  end

  def party_params
    params.permit(:duration, :party_date, :party_time, :host_id)
  end

  def movie
    @movie = Movie.find(params[:movie_id])
  end
end
