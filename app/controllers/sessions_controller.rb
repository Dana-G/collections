# contollers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # if user exists with entered password is correct
    if user.authenticate(params[:password])
      # save the user id
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
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

  private

  def user
    @_user ||= User.find_by_email(params[:email]) || null_user
  end

  def null_user
    Struct.new('User') do
      def authenticate(_)
        false
      end
    end.new
  end
end
