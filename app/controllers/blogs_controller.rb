class BlogsController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]#ログインしていない人をログイン画面へ
before_action :ensure_correct_user, only: [:edit, :update, :destroy]#本人以外できないようにする

	def index
		@blogs =Blog.all.order(created_at: :desc)
    @blog = Blog.new#新規投稿用
    @genres =  Genre.all#ジャンルサイドバー一覧
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
	end

  def genre
    @genres =  Genre.all#ジャンルサイドバー一覧
    @genre = Genre.find(params[:id])# Genreのデータベースのテーブルから一致するidを取得
    @blogs = @genre.blogs# Genreのデータベースのテーブルから取得条件に合致するオブジェクトを配列として取り出す
    @blog = Blog.new#新規投稿用
    #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
  end

	def show
    @genres =  Genre.all#ジャンルサイドバー一覧
    @blog = Blog.find(params[:id])
    @comment = BlogComment.new#新規コメント空
    @comments = @blog.blog_comments#アソシエーションhas_manyのため
    #サイドバー
    @user = @blog.user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
	end

  def edit
    @blog = Blog.find(params[:id])
     #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
    #ジャンルサイドバー一覧
    @genres =  Genre.all
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
       flash[:notice] = "更新しました！"#成功メッセ
       redirect_to blog_path(blog.id)
    else
      redirect_to edit_blog_path(blog.id)
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    flash[:notice] = "削除しました"
    redirect_to action: :index
  end

	def new
     #サイドバー
    @user = current_user
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user.id )
    #ジャンルサイドバー一覧
    @genres =  Genre.all
  	@blog = Blog.new#空のオブジェクト
  end

  def create
  	@blog = Blog.new(blog_params)
  	@blog.user_id = current_user.id #ブログのuser_idカラムにログインしている人のidを送る
  	if @blog.save
  		 flash[:notice] = "投稿しました！"#成功メッセ
  	   redirect_to blog_path(@blog.id)#ブログ詳細
    else
       redirect_to new_blog_path
    end
  end

  #編集制限
  def ensure_correct_user
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to action: :index#一覧へ戻す
    end
  end
  	private
  	def blog_params
  		params.require(:blog).permit(:title, :body, :blog_image, genre_ids: [])
  	end
end
