class TracksController < ApplicationController
  before_action :logged_in, only: %i[new create destroy]
  before_action :correct_user, only: %i[destroy]

  def index
    @tracks = Track.all
  end
  
  def new
    @track = Track.new
  end
  
  def show
    @track = Track.find(params[:id])
    @playlists = Playlist.all
  end
  
  def create
    @track = Track.new(user: current_user, title: params[:track][:title], mp3: params[:track][:mp3], description: params[:track][:description], thumbnail: params[:track][:thumbnail]&.read)

    if @track.save
      flash[:success] = '楽曲を追加しました'
      redirect_to current_user
    else
      render new_track_path
    end
  end
  
  def destroy
    @track = Track.find(params[:id])

    flash[:success] = '楽曲を削除しました'
    redirect_to tracks_path
  end
  
  def get_track_image
    track = Track.find(params[:id])
    send_data track.thumbnail, disposition: :inline, type: 'png'
  end
  
  def get_music
    track = Track.find(params[:id])
    send_data track.mp3
  end
  
  private
  
  def correct_user
    @track = current_user.tracks.find_by(id: params[:id])
    
    if @track.nil?
      flash[:notice] = '他人の楽曲を削除することはできません'
      redirect_to tracks_path
    end
  end
end
