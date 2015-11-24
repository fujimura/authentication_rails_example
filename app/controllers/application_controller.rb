class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Authentication
  helper_method :current_user

  # Rescue exception from Authentication and redirect to
  # the path to create new session
  #
  rescue_from Authentication::Unauthenticated do
    flash[:notice] = 'Login failed'
    redirect_to new_session_path
  end

  # Required to use Authentication
  #
  def find_current_user
    User.find_by_id current_user_id
  end

  # Optional, but most apps need this kind of filter method
  #
  def require_current_user
    redirect_to new_session_path unless logged_in?
  end
end
