class SessionController < ApplicationController
  protect_from_forgery with: :null_session

  def new_session; end

  def register_session; end

  def get_token
    response = AuthService.login(params[:email], params[:password])

    if !response["token"].nil?
      Session.find_or_create_by(email: response["email"], token: response["token"])
      session[:jwt] = response["token"]
      session[:email] = response["email"]
      redirect_to '/'
    else
      flash[:alert] = 'Invalid email or password'
      redirect_to new_session_path
    end
  end

  def create
    response = AuthService.register(params[:email], params[:password])

    if !response["token"].nil?
      Session.find_or_create_by(email: response["email"], token: response["token"])
      session[:jwt] = response["token"]
      session[:email] = response["email"]
      redirect_to '/'
    else
      flash[:alert] = 'Invalid email or password'
      redirect_to new_session_path
    end
  end

  def logout
    reset_session
    redirect_to new_session_path, notice: 'Logged out successfully'
  end
end
