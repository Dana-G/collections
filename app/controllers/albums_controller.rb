# # controllers/albums_controller.rb
class AlbumsController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    if @user
      @album = @user.albums.build
    else
      redirect_to root_path
      flash[:notice] = 'unauthorized but check_user missed it'
    end
  end

  def create
    @user = if current_user.id == params[:user_id]
      current_user
    else
      User.find(params[:user_id])
    end
    @album = @user.albums.build(album_params)
    if @album.save
      redirect_to @user
      flash[:notice] = 'Album creation success'
    else
      render 'new'
    end
  end

  def edit
    album
  end

  def update
    if album.update_attributes(album_params)
      redirect_to current_user, notice: 'Album update success'
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:name, :user_id, :snap_id)
  end

  def album
    @album ||= Album.find(params[:id])
  end
end
