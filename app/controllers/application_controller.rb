class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user, :refresh_session

  def login!(user)
    user_session = Session.create(user_id: user.id)
    session[:session_token] = user_session.session_token
  end

  def logout!
    user_session = Session.find_by(session_token: session[:session_token])
    user_session.destroy if user_session
  end

  def current_user
    user_session = Session.find_by(
      session_token: session[:session_token]
    )
    user_session && user_session.user
  end

  def refresh_session
    user_session = Session.find(session_token: session[:session_token])
    user_session.reset if user_session
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end

end
