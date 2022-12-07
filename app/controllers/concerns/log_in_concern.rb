module LogInConcern
  extend ActiveSupport::Concern

  def logged_in
    return if logged_in?

    flash[:danger] = 'ログインしてください'
    redirect_to login_path
  end
end