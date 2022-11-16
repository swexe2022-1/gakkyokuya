class SessionsController < ApplicationController
  before_action :log_out, only: %i[create]

  def new; end

  def create 
    user = User.find_by(email: params[:email])
    if user && BCrypt::Password.new(user.password_digest) == params[:password]
      log_in(user.id)
      redirect_to root_path
    else
      render 'shared/error'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
