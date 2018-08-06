class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def is_login?
    if !session[:user_id]
      redirect_to login_path
    end
  end
end
