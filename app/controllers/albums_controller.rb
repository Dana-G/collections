# # controllers/albums_controller.rb
class AlbumsController < ApplicationController
  def index
    @albums = Album.paginate(page: params[:page])
  end

  def new
    @album = current_user.albums.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to @current_user
      flash[:notice] = 'Album creation success'
    else
      render 'new'
    end
  end

  def edit
    @album = album
  end

  def update
    @album = album
    if @album.update_attributes(album_params)
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
    params.require(:album).permit(:name)
  end

  def album
    @album ||= Album.find(params[:id])
  end
end
