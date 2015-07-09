class SnapsController < ApplicationController
  def index
    @snaps = Snap.paginate(page: params[:page])
  end

  def new
    @snap = Snap.new
  end

  def edit
    @snap = Snap.find(params[:id])
  end

  def create
    @snap = current_user.album.snaps.new(snap_params)
    if @snap.save
      redirect_to @current_user
      flash[:notice] = 'Snap creation success'
    else
      render 'new'
    end
  end

  private

  def snap_params
      params.require(:snap).permit(
        :name,
        :image_uid,
        :image_name,
        :year,
        :color,
        :description,
        :album_id
      )
    end


end
