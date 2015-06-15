#
class User < ActiveRecord::Base
  has_secure_password

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: true },
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }

  validates :password, length: { minimum: 5 }
end
