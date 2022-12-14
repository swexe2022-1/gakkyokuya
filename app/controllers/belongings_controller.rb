class BelongingsController < ApplicationController
    def create
        track = Track.find(params[:track_id])
        playlist = Playlist.find(params[:playlist_id])
        @belongings = Belonging.new(track: track, playlist: playlist)
        
        begin
            @belongings.save!
            flash[:success] = "楽曲を追加しました"
            redirect_to playlist
        rescue
            flash[:danger] = "楽曲は重複させられません"
            redirect_to tracks_path
        end
        
    end
end
