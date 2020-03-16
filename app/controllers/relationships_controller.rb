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
		@user = User.find(params[:id])#レコードとってく
		@follow_users = Relationship.where(follower_id: @user.id).order(created_at: :asc).page(params[:page]).reverse_order
	end
	def followers
		@applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: @user )#サイドバー
		@user = User.find(params[:user_id])#レコードとってく
		@follow_users = Relationship.where(follower_id: @user.id).order(created_at: :asc).page(params[:page]).reverse_order#フォロー一覧
		@follower_users = Relationship.where(followed_id: @user.id).order(created_at: :asc).page(params[:page]).reverse_order#フォロワー一覧
	end
end
