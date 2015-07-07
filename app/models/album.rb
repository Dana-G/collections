# models/album.rb
class Album < ActiveRecord::Base
  belongs_to :user, inverse_of: :albums
end
