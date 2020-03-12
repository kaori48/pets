class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show#ユーザー情報
    @genres =  Genre.all#ジャンルサイドバー一覧
  	@user = User.find(params[:id])
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )#サイドバー
  end
  def edit
    @user = current_user
    @users = AnimalPermit.where(permitted_id: current_user.id, status: 0)#申請した人（０）
  end

  def mypage#使うか不明
    @user = current_user
  end
  def update
  	@user = current_user
  	@user.update(user_params)
  	redirect_to users_mypage_path
  end
  def destroy#削除できない
    @user = current_user
    @user.destroy
    redirect_to root_path
  end
  def animal
    @users = AnimalPermit.where(permitted_id: @user, status: 1)#お世話パートナーのサイドバー
    #@permit = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: user.id)
    #サイドバー
    @user = User.find(params[:id])
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )

  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :icon)
  end
end
