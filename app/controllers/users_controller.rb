class UsersController < ApplicationController
  def index
  end

  def show#ユーザー情報
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path
  end
  def delete
  end
  def edit
  end

  def mypage
  end
  private
  def user_params
  params.require(:user).permit(:name, :introduction, :icon)
  end
end
