class BlogsController < ApplicationController
	def index
		@blogs =Blog.all
	end

	def show
	end

	def new
  	@blog = Blog.new#k空のオブジェクト
  end
  def create
  	@blog = Blog.new(blog_params)
  	@blog.user_id = current_user.id #ブログのuser_idカラムにログインしている人のidを送る
  	@blog.save
  		#flash[:notice] = "投稿に成功しました！"#成功メッセ、出るとこ決めてない
  	    redirect_to user_path(current_user)#userのshowページへ(仮)
  	end

  	def edit
  	end

  	private
  	def blog_params
  		params.require(:blog).permit(:title, :body, :blog_image, genre_ids: [])
  	end
  end
