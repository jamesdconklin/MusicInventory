class SessionsController < ApplicationController
  def new
    # TODO: Redirect if logged in.
  end

  def create
    # TODO: Redirect if logged in already.
    user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )
    if user
      login!(user)
      # render json: user.sessions
      redirect_to user_url(user)
    else
      flash[:errrors] = ["Email or password incorrect"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
  end
end
