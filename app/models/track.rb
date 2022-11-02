class Track < ApplicationRecord
    belongs_to :user
    belongs_to :playlist
    
    validates :mp3, presence: true
    validates :title, presence: true, length: { maximum: 255}
    validates :description, length: { maximum: 255}
end
