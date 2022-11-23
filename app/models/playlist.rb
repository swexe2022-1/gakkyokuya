class Playlist < ApplicationRecord
  belongs_to :user
  has_many :belongings
  has_many :tracks, through: :belongings, source: :track
end
