class PlaylistsController < ApplicationController
  
  
  def index
    @playlists = Playlist.all
    
  end
  
  def show
    @playlist = Playlist.find(params[:id])
  end
  
  def new
    @Playlist = Playlist.new
  end
  
  def create
    #user = User.find_by(uid: session[:uid])
    @Playlist = Playlist.new(title: params[:playlist][:title],thumbnail: params[:playlist][:thumbnail].read)

    if @Playlist.save
      redirect_to root_path
    else
      render playlists_new_path
    end
  end
  
  def add_track
    playlist = Playlist.find(params[:id])
    track = Track.find(params[:track_id])
    
    playlist.tracks << track
    redirect_to playlist
  end
  
end