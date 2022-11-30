class BelongingsController < ApplicationController
    def create
        track = Track.find(params[:track_id])
        playlist = Playlist.find(params[:playlist_id])
        @belongings = Belonging.new(track: track, playlist: playlist)
        
        if @belongings.save
            flash[:success] = "楽曲を追加しました"
        else
            flash[:notice] = "楽曲は重複させられません"
        end
        redirect_to track
    end
end
