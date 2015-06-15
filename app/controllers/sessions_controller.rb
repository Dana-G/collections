# contollers/sessions_controller.rb
class SessionsController < ApplicationController
  # before_filter :authorize

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists with entered password is correct
    if user && user.authenticate(params[params[:password]])
      # save the user id
      session[:user_id] = user.id
      redirect_to root_url, flash[:notice] = 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_url
  end
end
