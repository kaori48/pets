class FavoritesController < ApplicationController
	def create
		blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.new(blog_id: blog.id)#上の@blogのidとuseridをfavoriteblog_idカラムにいれる
		favorite.save!
		redirect_to request.referrer#移動まえのURL
	end
	def destroy
		blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.find_by(blog_id: blog.id)
		favorite.destroy
		redirect_to request.referrer#移動まえのURL
	end
end
