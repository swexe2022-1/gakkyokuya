class Track < ApplicationRecord
    has_many :belongings
    has_many :playlists, through: :belongings, source: :playlist
    #belongs_to :user
    #belongs_to :playlist
    mount_uploader :mp3, AudiofileUploader
    
    validates :mp3, presence: true
    validates :title, presence: true, length: { maximum: 255}
    validates :description, length: { maximum: 255}
end
