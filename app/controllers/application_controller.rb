# controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def check_user
    redirect_to root_url, notice: 'unauthorized' unless current_user_match?
  end
  helper_method :check_user

  def current_user_match?
    return false unless current_user
    params[:id] == current_user.id.to_s
  end
  helper_method :current_user_match?

end
