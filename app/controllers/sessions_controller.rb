class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
    login! user # user will be nil unless authenticated
    flash[:notice] = 'Logged in!'
    redirect_to root_path
  end

  def destroy
    logout!
    redirect_to root_path
  end
end
