class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
