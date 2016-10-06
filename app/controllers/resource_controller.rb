class ResourceController < ApplicationController
  before_action :require_login

  def require_login(user = nil)
    if current_user
      if user && user != current_user
        flash[:errors] = ["requested action forbidden for current user"]
        redirect_to new_session_url
      end
    else
      flash[:errors] = ["requested action requires a logged-in user"]
      redirect_to new_session_url
    end
  end
end
