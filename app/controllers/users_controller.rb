class UsersController < ApplicationController
  before_action :log_out, only: %i[create]

  def show
    @user = User.find(params[:id])
    @tracks = @user.tracks
    @playlists = @user.playlists
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(name: params[:user][:name], 
                    email: params[:user][:email],
                    password_digest:  BCrypt::Password.create(params[:user][:password]))
    if user.save!
      session[:login_user_id] = user.id
      redirect_to user
    else
      render 'shared/error'
    end
  end
end
