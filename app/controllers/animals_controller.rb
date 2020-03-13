class AnimalsController < ApplicationController
  before_action :authenticate_user!#ログインしていない人をログイン画面へ
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]#本人以外できないようにする
  def index
  end

  def show
  	@animal = Animal.find(params[:id])
  	@comment = AnimalComment.new#コメント機能新規
  	@comments = @animal.animal_comments.order(created_at: :asc).page(params[:page]).reverse_order#コメント一覧
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
    #お世話パートナーサイドバー
    @pertner = @animal.user.id
    @users = AnimalPermit.where(permitted_id: @pertner, status: 1)#お世話パートナーのサイドバー
  end

  def new
  	@animal = Animal.new
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end
  def create
  	animal = Animal.new(animal_params)
  	animal.user_id = current_user.id
  	animal.save
  	redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
  end

  def edit
  	@animal = Animal.find(params[:id])
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

  def update
  	animal = Animal.find(params[:id])
  	animal.update(animal_params)
  	redirect_to action: :show#showへ
  end

  def destroy
  	animal = Animal.find(params[:id])
  	animal.destroy
  	redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
  end

  #編集制限
  def ensure_correct_user
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to action: :index#一覧へ戻す
    end
  end
  private
  def animal_params
  	params.require(:animal).permit(:animal_image, :name, :birth, :food, :toilet, :water, :hospital, :other)
  end
end
