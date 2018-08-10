class UsersController < ApplicationController
  before_action :is_login?, only: [:show]
  
  def index
    @user = User.new
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to user_path(@user.id), success: 'ようこそ、miniscrumへ'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def show
    
    render plain: "show"
  end
  
  private
  def user_param
    params.require(:user).permit(:name, :email, :password)
  end
end
