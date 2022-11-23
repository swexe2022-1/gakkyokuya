module LogInConcern
  extend ActiveSupport::Concern

  def logged_in
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_path
  end
end