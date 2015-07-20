# app/controller/snaps_controller.rb
class SnapsController < ApplicationController
  before_action :check_user, except: [:show, :index]

  def index
    @snaps = Snap.paginate(page: params[:page])
  end

  def new
    @snap = current_user.snap.new
  end

  def create
    @snap = current_user.snaps.new(snap_params)
    if @snap.save
      redirect_to @current_user
      flash[:notice] = 'Snap creation success'
    else
      render 'new'
    end
  end

  def edit
    @snap = Snap
  end

  def update
    @snap = snap
    if @snap.update_attributes(snap_params)
      redirect_to current_user, notice: 'Snap update success'
    else
      render :edit
    end
  end

  def show
    @snap = Snap.find(params[:id])
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

  def snap
    @snap ||= Snap.find(params[:id])
  end
end
