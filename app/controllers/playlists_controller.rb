class PlaylistsController < ApplicationController
  
  
  def index
    @playlists = Playlist.all
  end
  
  def show
    @playlist = Playlist.find(params[:id])
  end
  
  def new
    @playlist = Playlist.new
  end
  
  def create
    #user = User.find_by(uid: session[:uid])
    @playlist = Playlist.new(title: params[:playlist][:title],thumbnail: params[:playlist][:thumbnail].read)

    if @playlist.save
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
  
  def get_playlist_image
    track = Playlist.find(params[:id])
    send_data track.thumbnail, disposition: :inline, type: 'png'
  end
  
end