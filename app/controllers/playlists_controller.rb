class PlaylistsController < ApplicationController
  before_action :logged_in, only: %i[new create destroy add_track]
  before_action :correct_user, only: %i[destroy]

  def index
    @playlists = Playlist.all
  end
  
  def show
    @playlist = Playlist.find(params[:id])
    @tracks = Playlist.find(params[:id]).tracks
    
    if params[:current_play].blank?
      @current_play_index = 0
    else
      @current_play_index = params[:current_play].to_i
    end
    @current_play= @tracks[@current_play_index]
  end
  
  def new
    @playlist = Playlist.new
  end
  
  def create
    @playlist = Playlist.new(user: current_user, title: params[:playlist][:title],thumbnail: params[:playlist][:thumbnail]&.read)

    if @playlist.save
      flash[:success] = 'プレイリストを作成しました'
      redirect_to current_user
    else
      render new_playlist_path
    end
  end
  
  def add_track
    playlist = Playlist.find(params[:id])
    track = Track.find(params[:track_id])
    
    playlist.tracks << track
    
    flash[:success] = 'プレイリストに楽曲を追加しました'
    redirect_to playlist
  end
  
  def get_playlist_image
    track = Playlist.find(params[:id])
    send_data track.thumbnail, disposition: :inline, type: 'png'
  end
  
  def remove_track
    playlist = Playlist.find(params[:id])
    track = Track.find(params[:track_id])
    
    playlist.tracks.delete(track)
    
    flash[:success] = 'プレイリストから楽曲を削除しました'
    redirect_to playlist
  end
  
  def destroy
    playlist = Playlist.find(params[:id])
    playlist.destroy
    
    flash[:success] = 'プレイリストを削除しました'
    redirect_to playlists_path
  end
  
  private
  
  def correct_user
    @playlist = current_user.playlists.find_by(id: params[:id])
    
    redirect_to root_path if @playlist.nil?
  end


end