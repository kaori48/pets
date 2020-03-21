class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:mypage, :update, :destroy, :new, :create, :animal]#ログインしていない人をログイン画面へ
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]#投稿した本人以外できないようにする（管理者もつける）
  #animalページの閲覧制限、不可の場合blog indexへ飛ばす  ページを本人と、ステータスを持った人のみに出したい。他の人はblog index
  before_action :ensure_animal_user, only: [:animal]#ページを（animalページの場合、URLにIDが入っており、そのIDとcurrent_userが同じ場合に表示）




  def index
    @users = User.all.order(created_at: :asc).page(params[:page]).reverse_order
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

  def show#ユーザー情報
    @genres =  Genre.all#ジャンルサイドバー一覧
  	@user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: :asc).page(params[:page]).reverse_order#うまくいかない
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )#サイドバー
  end
  def edit
    @user = current_user
    @users = AnimalPermit.where(permitted_id: current_user.id, status: 0).order(created_at: :asc).page(params[:page]).reverse_order#申請した人（０）
    @permitted_users = AnimalPermit.where(permitter_id: current_user.id, status: 1).order(created_at: :asc).page(params[:page]).reverse_order#自分をお世話パートナーにしている人
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
  	redirect_to edit_user_path(current_user.id)
  end
  def destroy#削除できない
    user = current_user
    user.destroy
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
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to action: :index#一覧へ戻す
    end
  end

  def ensure_animal_user
    @user = User.find(params[:id])
    p @user.id != current_user.id
    p AnimalPermit.find_by(permitted_id: current_user.id, status: 1).nil?
    if @user != current_user && AnimalPermit.find_by(permitter_id: @user.id, permitted_id: current_user.id, status: 1).nil?
      redirect_to blogs_path#一覧へ戻す
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :icon)
  end
end
