class SessionsController < ApplicationController
  before_action :log_out, only: %i[create]

  def new; end

  def create 
    user = User.find_by(email: params[:email])
    if user && BCrypt::Password.new(user.password_digest) == params[:password]
      log_in(user.id)
      redirect_to user
    else
      flash[:danger] = 'メールアドレス または パスワード が違います'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end
end
