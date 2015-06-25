#
class User < ActiveRecord::Base
  has_secure_password
  self.per_page = 10

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: true },
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  extend Dragonfly::Model
  dragonfly_accessor :avatar
  validates_presence_of :avatar

  validates :avatar, presence: true
  validates_size_of :avatar, maximum: 3.megabytes,
                    message: "should be no more than 3 megabytes"

  validates_property :format, of: :avatar, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp"
end
