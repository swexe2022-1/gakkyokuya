module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:login_user_id]) if session[:login_user_id]
  end

  def log_in(user_id)
    session[:login_user_id] = user_id
  end

  def log_out
    session.delete(:login_user_id) if session[:login_user_id]
  end
end
