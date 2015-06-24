#
class User < ActiveRecord::Base
  has_secure_password

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: true },
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  extend Dragonfly::Model
  dragonfly_accessor :avatar
end
