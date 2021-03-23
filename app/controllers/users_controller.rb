class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_params = user_params
    new_params[:email] = user_params[:email].downcase
    new_params[:username] = user_params[:username].downcase
    user = User.create(new_params)
    if user
      flash[:success] = 'Account created successfully.'
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = 'One or more fields was taken or invalid.'
      render :new
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user
      authenticate
    else
      flash[:error] = 'Invalid username and password.'
      redirect_to root_path
    end
  end

  def authenticate
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid password. Please try again.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
