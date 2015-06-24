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

  dragonfly_accessor :avatar
  validates_presence_of :avatar
end
