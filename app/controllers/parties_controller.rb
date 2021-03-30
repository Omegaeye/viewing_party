class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
    @movie = session[:movie]
  end

  def create
    @movie = Movie.find_or_create_by(session[:movie])
    party = @movie.parties.create(party_params)
    if party.save
      @pv = PartyViewer.create_multiple_viewers(params[:friends], party.id)
      viewing_party_flash
      flash[:success] = 'Party Created'
      redirect_to dashboard_path
    else
      flash[:alert] = "Party can't be created, you're missing some information."
      render :new
    end
  end

  def viewing_party_flash
    if @pv
      flash[:success] = 'Party Viewer Created'
    else
      flash[:error] = @pv.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def party_params
    params.permit(:duration, :party_date, :party_time, :host_id)
  end
end
