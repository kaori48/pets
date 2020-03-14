class SearchController < ApplicationController
def search#検索
    @applying = AnimalPermit.find_by(permitter_id: current_user.id, permitted_id: current_user.id )
    @genres =  Genre.all#ジャンルサイドバー一覧
  	@user_or_blog = params[:option]#optionの値を持ってくる
  	if @user_or_blog == "1" #optionの値が１の場合
  	   @users = User.search(params[:search]).order(created_at: :asc).page(params[:page]).reverse_order#searchメソッドはモデルへ
  	   @word = params[:search] + "の検索結果です。"
  		if @users == nil || @users == []
  			@users = User.all.order(created_at: :asc).page(params[:page]).reverse_order
  	   @word = params[:search] + "の検索結果はありません。"
  	    end
  	else #optionの値が１以外の場合
  	   @blogs = Blog.search(params[:search]).order(created_at: :asc).page(params[:page]).reverse_order#searchメソッドはモデルへ
  	   @word = params[:search] + "の検索結果です。"
  	   if @blogs == nil || @blogs == []
  	   	@blogs = Blog.all.order(created_at: :asc).page(params[:page]).reverse_order
  	   	@word = params[:search] + "の検索結果はありません。"
  	   end
  	end
  end
end
