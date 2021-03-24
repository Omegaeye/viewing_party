class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_params = user_params
    new_params[:email] = user_params[:email].downcase
    new_params[:username] = user_params[:username].downcase
    user = User.create(new_params)
    if user.id
      flash[:success] = 'Account created successfully.'
      session[:user_id] = user.id
      redirect_to dashboard_index_path
    else
      flash[:alert] = 'One or more fields was taken or invalid.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
