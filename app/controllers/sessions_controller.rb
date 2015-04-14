class SessionsController < ApplicationController
  skip_before_action :check_access, only: [:create, :new]

  def new
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Log out successfully."
    redirect_to new_session_path
  end

  def create
    @user = User.authentication(params[:username],params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to articles_path
    else
      flash[:notice] = "The username or password is not correct."
      redirect_to new_session_path
    end
  end
end
