# models/album.rb
class Album < ActiveRecord::Base
  belongs_to :user, inverse_of: :albums
  validates_presence_of :user_id

  validate :user_exists

  private

  def user_exists
    errors.add(:user_id, 'doesn\'t exist') unless
    User.exists?(user_id)
  end
end
