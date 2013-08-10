class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_user(user)
    user.session_token = SecureRandom.urlsafe_base64
    user.save!

    session[:session_token] = user.session_token
    redirect_to bands_url
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def authenticate!
    p session
    if !logged_in?
      redirect_to new_sessions_url
    end
  end

  def logged_in?
    !!current_user
  end
end