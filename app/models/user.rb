class User < ApplicationRecord
  has_many :tracks
  has_many :playlists
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password_digest, presence: true
end
