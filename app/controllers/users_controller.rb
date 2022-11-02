class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(name: params[:name], 
                    email: params[:email],
                    password_digest:  BCrypt::Password.create(params[:password]))
    if user.save!
      redirect_to user
    else
      render 'shared/error'
    end
  end
end
