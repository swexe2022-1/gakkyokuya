class BelongingsController < ApplicationController
    def create
        track = Track.find(params[:track_id])
        playlist = Playlist.find(params[:playlist_id])
        belongings = Belonging.new(track: track, playlist: playlist)
        
        if belongings.save
            flash[:success] = "楽曲を作成しました"
        else
            flash[:error] = "楽曲の追加に失敗しました"
        end
        redirect_to track
    end
end
