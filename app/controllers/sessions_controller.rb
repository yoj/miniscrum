class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email])
    if !@user.nil? && @user.authenticate(params[:session][:password])
      # sessionに保存
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), success: 'ログインしました'
    else 
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
    
  end
  
  
  def destroy
    session[:user_id] = nil
    
    redirect_to login_path, success: 'ログアウトしました'
  
  end
end
