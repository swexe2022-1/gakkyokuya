#require 'bcrypt'
class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end
  
  
  def new
    @track = Track.new
  end
  
  def create
    #user = User.find_by(uid: session[:uid])
    @track = Track.new(title: params[:track][:title], mp3: params[:track][:mp3], description: params[:track][:description], thumbnail: params[:track][:thumbnail].read)

    if @track.save
      redirect_to tracks_path
    else
      render new_track_path
    end
  end
  
  def destroy
    track = Track.find(params[:id])
    track.destroy
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
end
