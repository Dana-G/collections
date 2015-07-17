# # controllers/albums_controller.rb
class AlbumsController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def new
    @album = user.albums.new
  end

  def create
    if current_user.id == params[:user_id]
      current_user
    else
      User.find(params[:user_id])
    end
    @album = user.albums.new(album_params)
    if album.save
      redirect_to user
      flash[:notice] = 'Album creation success'
    else
      render 'new'
    end
  end

  def edit
    user
  end

  def update
    if album.update_attributes(album_params)
      redirect_to current_user, notice: 'Album update success'
    else
      render :edit
    end
  end

  def show
    album
  end

  private

  def album_params
    params.require(:album).permit(:name, :user_id, :snap_id)
  end

  def album
    @album ||= Album.find(params[:id])
  end

  #refactored
  def user
    return album.user unless params[:user_id].present?
    @_album ||= User.find(params[:user_id])
  end

  def logged_in?
    return false unless current_user
    params[:id] == current_user.id.to_s
  end

  def check_user
    if logged_in?
      current_user
    else
    redirect_to root_url, notice: 'unauthorized'
    end
  end
end
