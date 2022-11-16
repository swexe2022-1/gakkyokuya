class Playlist < ApplicationRecord
    has_many :belongings
    has_many :tracks, through: :belongings, source: :track
    
    validates :track_id, uniqueness:{scope: %i[plailist_id]}
    validates :plailist_id, uniqueness:{scope: %i[track_id]}
end
