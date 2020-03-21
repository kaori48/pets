class AnimalsController < ApplicationController
  before_action :authenticate_user!#ログインしていない人をログイン画面へ
  before_action :ensure_correct_user, only: [:destroy]#本人以外できないようにする
  before_action :ensure_animal_user, only: [:show,:edit,:update,:destroy] #ページを本人と、ステータスを持った人のみに出したい。他の人はblog index

  def index
  end

  def show
  	@animal = Animal.find(params[:id])
  	@comment = AnimalComment.new#コメント機能新規
  	@comments = @animal.animal_comments.order(created_at: :asc).page(params[:page]).reverse_order#コメント一覧
    #サイドバー
    @animaluser = @animal.user
    @user = @animal.user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @animaluser.id )
    #お世話パートナーサイドバー
    @pertner = @animal.user.id
    @users = AnimalPermit.where(permitted_id: @pertner, status: 1)#お世話パートナーのサイドバー
    #タスク
    @task = Task.new#タスク新規
    @tasks = @animal.tasks.order(created_at: :asc)#タスク一覧
  end

  def new
  	@animal = Animal.new
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end
  def create  #エラー文で使用するので@つける
  	@animal = Animal.new(animal_params)
  	@animal.user_id = current_user.id
  	if @animal.save
      flash[:notice] = "登録しました！"#成功メッセ
  	  redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
    else
      #サイドバー
      @user = current_user
      @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
      render :new
    end
  end

  def edit
  	@animal = Animal.find(params[:id])
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

  def update #エラー文で使用するので@つける
  	@animal = Animal.find(params[:id])
  	if @animal.update(animal_params)
  	  redirect_to action: :show#showへ
    else
      #サイドバー
      @user = current_user
      @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
      render :edit
    end
  end

  def destroy
  	animal = Animal.find(params[:id])
  	animal.destroy
  	redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
  end

  #編集制限
  def ensure_correct_user
    @animal = Animal.find(params[:id])
    if @animal.user_id != current_user.id
      redirect_to blogs_path#一覧へ戻す
    end
  end

    def ensure_animal_user
    @animal = Animal.find(params[:id])
   # p @user.id != current_user.id
    #p AnimalPermit.find_by(permitted_id: current_user.id, status: 1).nil?
    if @animal.user_id != current_user.id && AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @animal.user_id, status: 1).nil?
      redirect_to blogs_path#一覧へ戻す
    end
  end

  private
  def animal_params
  	params.require(:animal).permit(:animal_image, :name, :birth, :food, :toilet, :water, :hospital, :other)
  end
end
