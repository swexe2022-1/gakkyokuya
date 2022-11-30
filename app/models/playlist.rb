class Playlist < ApplicationRecord
  belongs_to :user
  has_many :belongings
  has_many :tracks, through: :belongings, source: :track
  
  validates :title, presence: true, length: { maximum: 255}
end
