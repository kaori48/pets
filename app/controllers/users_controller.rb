class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show#ユーザー情報
  	@user = current_user
  end
  def update
  	@user = current_user
  	@user.update(user_params)
  	redirect_to user_path
  end
  def destroy#削除できない
    @user = current_user
    @user.destroy
    redirect_to root_path
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
