class BlogsController < ApplicationController
	def index
		@blogs =Blog.all
    @blog = Blog.new#新規投稿用
	end

	def show
    @blog = Blog.find(params[:id])
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
