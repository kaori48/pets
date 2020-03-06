class BlogsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@blog = Blog.new#k空のオブジェクト
  end
  def create
  	@blog = Blog.new(blog_params)
  	@blog.save!
  	redirect_to user_path(current_user)#userのshowページへ
  end

  def edit
  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :body, :blog_image)
  end
end
