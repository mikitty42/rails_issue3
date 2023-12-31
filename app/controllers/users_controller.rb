class UsersController < ApplicationController
    before_action :set_user,only: [:edit,:update]

  def new
      @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
          redirect_to new_session_path,notice: 'Profileを登録しました'
      else
          render :new
      end
  end
  
  def show
      @user = User.find(params[:id])
  end

  def edit
      if current_user.id != @user.id
          flash[:danger] = '権限がありません'
          redirect_to new_user_path
      end
  end
  
  def update
      if @user.update(user_params)
          redirect_to user_path(@user.id),notice: 'Profileを編集しました'
      else
          render :edit
      end
  end
  
  
  private
  
  def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
  
  def set_user
      @user = User.find(params[:id])
  end
end
