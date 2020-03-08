class RelationshipsController < ApplicationController
	def create
		current_user.follow(params[:user_id])#modelで定義
		redirect_to request.referer
	end
	def destroy
		current_user.unfollow(params[:user_id])#modelで定義
        redirect_to request.referer
	end
	def follows
		user = User.find(params[:user_id])#レコードとってく
		@users = user.following_user#
	end
	def followers
		user = User.find(params[:user_id])#レコードとってく
		@users = user.follower_user#
	end
end
