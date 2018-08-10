class ApplicationController < ActionController::Base
  def is_login?
    if !session[:user_id]
      redirect_to login_path
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
