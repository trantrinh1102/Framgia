class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      login user
      params[:remember] == "1" ? remember(user) : forget(user)
      redirect_to user_path(user)
    else
      flash.alert = t "sessions.login_fail"
      redirect_to new_session_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
