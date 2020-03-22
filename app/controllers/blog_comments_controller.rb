class BlogCommentsController < ApplicationController
	before_action :ensure_correct_user, only: [:edit, :destroy]#本人とadmin権限の人しかできないようにする
	def create
		@blog = Blog.find(params[:blog_id])#blogのidをとってくる
		@comment = @blog.blog_comments.new(blog_comment_params)#
		@comment.user_id = current_user.id #コメントしてる人のユーザーid
		if @comment.save
		   redirect_to request.referer#ひとつ前のURLを返す
		else
		   flash[:notice] = "コメントを入力してください"#成功メッセ
  	       redirect_to request.referer#ひとつ前のURLを返す
  	    end
	end
	def destroy
		@comment = BlogComment.find(params[:blog_id])
		@comment.destroy
		redirect_to request.referer#ひとつ前のURLを返す

	end

	#編集制限
    def ensure_correct_user
      @comment = BlogComment.find(params[:blog_id])
    if @comment.user_id != current_user.id && current_user.admin == 0
      redirect_to blogs_path#移動まえのURL
    end
  end
	private
	def blog_comment_params
		 params.require(:blog_comment).permit(:comment)
	end
end
