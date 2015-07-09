class AddPrimaryImageToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :snap, index: true, foreign_key: true
  end
end
