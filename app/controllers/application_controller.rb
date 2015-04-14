class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :check_access

  def check_access
    redirect_to new_session_path if session[:user_id] == nil
  end

  def current_user
    User.find(session[:user_id])
  end
end
