class BlogsController < ApplicationController
	def index
		@blogs =Blog.all.order(created_at: :desc)
    @blog = Blog.new#新規投稿用
    @genres =  Genre.all#ジャンルサイドバー一覧
	end

  def genre
    @genres =  Genre.all#ジャンルサイドバー一覧
    @genre = Genre.find(params[:id])# Genreのデータベースのテーブルから一致するidを取得
    @blogs = @genre.blogs# Genreのデータベースのテーブルから取得条件に合致するオブジェクトを配列として取り出す
    @blog = Blog.new#新規投稿用
  end

	def show
    @genres =  Genre.all#ジャンルサイドバー一覧
    @blog = Blog.find(params[:id])
    @comment = BlogComment.new#新規コメント空
    @comments = @blog.blog_comments#アソシエーションhas_manyのため
	end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to action: :index
  end

	def new
  	@blog = Blog.new#空のオブジェクト
  end

  def create
  	@blog = Blog.new(blog_params)
  	@blog.user_id = current_user.id #ブログのuser_idカラムにログインしている人のidを送る
  	@blog.save
  		#flash[:notice] = "投稿に成功しました！"#成功メッセ、出るとこ決めてない
  	redirect_to blog_path(@blog.id)#ブログ詳細
  end

  	private
  	def blog_params
  		params.require(:blog).permit(:title, :body, :blog_image, genre_ids: [])
  	end
end
