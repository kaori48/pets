class AnimalCommentsController < ApplicationController
	def create
		@animal = Animal.find(params[:animal_id])#animalのidをとってくる
		@comment = @animal.animal_comments.new(animal_comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:notice] = "投稿しました！"#成功メッセ
		    redirect_to request.referer#ひとつ前のURLを返す
		else
  	        flash[:notice] = "コメントを入力してください"#成功メッセ
  	        redirect_to request.referer#ひとつ前のURLを返す
        end
	end

	def destroy
		comment = AnimalComment.find(params[:animal_id])
		comment.destroy
		redirect_to request.referer#ひとつ前のURLを返す
	end

    private
    def animal_comment_params
    	params.require(:animal_comment).permit(:comment)
    end
end
