module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    if session[:jwt].present?
      begin
        secret_key = Rails.application.secrets.secret_key_base.to_s
        decoded_token = JWT.decode(session[:jwt], secret_key, true, { algorithm: 'HS256' }).first
        @current_user = decoded_token['email']
      rescue JWT::DecodeError => e
        reset_session
        redirect_to new_session_path, alert: "Please log in. #{e.message}"
      end
    else
      redirect_to new_session_path, alert: 'Please log in'
    end
  end

  def current_user
    @current_user ||= session[:email] if session[:email].present?
  end

  def user_signed_in?
    current_user.present?
  end
end
