# controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
      flash[:notice] = 'Thanks for signing up.'
    else
      flash[:notice] = 'There was an issue signing up, please try again.'
      render 'new'

    end
  end

  def edit
    user
  end

  def update
    if user.update_attributes(user_params)
      redirect_to user_path(user), notice: 'success'
    else
      render :edit
    end
  end

  def show
    user
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def logged_in?
    return false unless current_user
    params[:id] == current_user.id.to_s
  end

  def check_user
    if logged_in?
      @current_user
    else
      redirect_to root_url, notice: 'unauthorized'
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :avatar
    )
  end
end
