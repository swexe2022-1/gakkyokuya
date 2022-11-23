class PlaylistsController < ApplicationController
  before_action :logged_in, only: %i[new create add_track]
  before_action :correct_user, only: %i[destroy]

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
    @playlist = Playlist.new(user: current_user, title: params[:playlist][:title],thumbnail: params[:playlist][:thumbnail].read)

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
  
  private
  
  def correct_user
    @playlist = current_user.playlists.find_by(id: params[:id])
    
    redirect_to root_path if @playlist.nil?
  end
end