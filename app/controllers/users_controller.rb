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
    @user = User.new(name: params[:name], 
                    email: params[:email],
                    password_digest:  BCrypt::Password.create(params[:password]))
    if @user.save
      flash[:notice] = '登録しました'
      session[:login_user_id] = @user.id
      redirect_to @user
    else
      render new_user_path
    end
  end
end
