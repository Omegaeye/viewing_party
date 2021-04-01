class PartiesController < ApplicationController
  def new
    @viewing_party = Party.new
    @movie = session[:movie]
  end

  def create
    @movie = Movie.find_or_create_by(session[:movie])

    party = @movie.parties.date_check_then_create(party_params)
    if party.save
      create_party_viewers(params[:friends], party)
      flash[:success] = 'Party Created'
      redirect_to dashboard_path
    else
      flash[:alert] = "Party can't be created, you're missing some information."
      render :new
    end
  end

  def create_party_viewers(ids, party)
    return '' if ids.nil?

    ids.all? do |viewer_id|
      PartyViewer.create!(party_id: party.id, viewer_id: viewer_id)
      friend = User.find_by(id: viewer_id)
      send_email(friend, party)
    end
    session.delete(:movie)
  end

  def send_email(friend, party)
    recipient = friend.email
    movie = Movie.find_by(id: party.movie_id)

    email_info = {
      user: current_user,
      friend: friend.username,
      party_info: party,
      movie: movie
    }

    FriendNotifierMailer.inform(email_info, recipient).deliver_now
  end

  private

  def party_params
    params.permit(:duration, :party_date, :party_time, :host_id)
  end
end
