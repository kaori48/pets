class HomesController < ApplicationController
	def top
	  @genres =  Genre.all#ジャンルサイドバー一覧
	  @blog = Blog.new#新規投稿用
	  @blogs =Blog.all.order(created_at: :asc).page(params[:page]).reverse_order
	end
end
