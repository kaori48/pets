class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:mypage, :update, :destroy, :new, :create, :animal]#ログインしていない人をログイン画面へ
  before_action :ensure_correct_user, only: [:edit, :mypage,:update, :destroy]#本人以外できないようにする

  def index
    @users = User.all.order(created_at: :asc).page(params[:page]).reverse_order
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

  def show#ユーザー情報
    @genres =  Genre.all#ジャンルサイドバー一覧
  	@user = User.find(params[:id])
    @user.blogs = Blogs.order(created_at: :asc).page(params[:page]).reverse_order#うまくいかない
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )#サイドバー
  end
  def edit
    @user = current_user
    @users = AnimalPermit.where(permitted_id: current_user.id, status: 0).order(created_at: :asc).page(params[:page]).reverse_order#申請した人（０）
    @permitted_users = AnimalPermit.where(permitter_id: current_user.id, status: 1)#自分をお世話パートナーにしている人
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
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
    @user = User.find(params[:id])
    @users = AnimalPermit.where(permitted_id: @user, status: 1).order(created_at: :asc).page(params[:page]).reverse_order#お世話パートナーのサイドバー
    #@permit = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: user.id)
    #サイドバー
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

  #編集制限
  def ensure_correct_user
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to action: :index#一覧へ戻す
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :icon)
  end
end
