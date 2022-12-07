class Belonging < ApplicationRecord
    belongs_to :track
    belongs_to :playlist
    
    validates :track, presence: true, uniqueness: true
end
