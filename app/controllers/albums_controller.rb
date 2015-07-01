class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end


  private
   def post_params
    params.require(:album).permit(:name)
  end
end
