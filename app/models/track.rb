class Track < ApplicationRecord
    #belongs_to :user
    #belongs_to :playlist
    mount_uploader :mp3, AudiofileUploader
    
    validates :mp3, presence: true
    validates :title, presence: true, length: { maximum: 255}
    validates :description, length: { maximum: 255}
end
