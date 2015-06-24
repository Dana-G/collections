# controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user), notice: 'success'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = 'Thanks for signing up.'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def check_user
    redirect_to root_url, notice: 'unauthorized' unless current_user_match?
  end

  def current_user_match?
    return false unless current_user
    params[:id] == current_user.id.to_s
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end
end
