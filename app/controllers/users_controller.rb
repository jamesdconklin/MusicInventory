class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(email: user_params[:email])
    @user.password = user_params[:password]
    if @user.save
      login!(@user)
      render
    else
      render status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      if current_user
        if current_user == @user
          render
        else
          redirect_to new_session_url
          # render status: :forbidden
        end
      else
        redirect_to new_session_url
        # render status: :unauthorized
      end
    else
      redirect_to new_session_url
      # render status: :not_found
    end
  end
end
