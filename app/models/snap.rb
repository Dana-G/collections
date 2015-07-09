class Snap < ActiveRecord::Base
  belongs_to :album, inverse_of: snaps


  # dragonfly
  extend Dragonfly::Model
  dragonfly_accessor :image

  validates_size_of(:image,
                    maximum: 3.megabytes,
                    message: 'should be no more than 3 megabytes')

  validates_property(:format,
                     of: :image,
                     in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: 'should be either .jpeg, .jpg, .png, .bmp')



end
