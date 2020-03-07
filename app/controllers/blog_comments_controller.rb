class BlogCommentsController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])#blogのidをとってくる
		@comment = @blog.blog_comments.new(blog_comment_params)#
		@comment.user_id = current_user.id #コメントしてる人のユーザーid
		@comment.save
		redirect_to request.referer#ひとつ前のURLを返す
	end
	def destroy
		@comment = BlogComment.find(params[:blog_id])
		@comment.destroy
		redirect_to request.referer#ひとつ前のURLを返す

	end
	private
	def blog_comment_params
		 params.require(:blog_comment).permit(:comment)
	end
end
