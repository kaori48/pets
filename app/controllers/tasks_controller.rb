class TasksController < ApplicationController
	before_action :authenticate_user!#ログインしていない人をログイン画面へ
	def create
		animal = Animal.find(params[:animal_id])#animalのidをとってくる
		task = animal.tasks.new(task_params)
		if task.save
		redirect_to request.referer#ひとつ前のURLを返す
	    else
	    flash[:notice] = "登録できませんでした"
	    redirect_to request.referer
	    end
	end
	def update
	end
	def change
        task = Task.find(params[:id])
        task.done = !task.done
        task.save
	end
	def destroy
		task = Task.find(params[:animal_id])#animalのidをとってくる
		task.destroy
		redirect_to request.referer#ひとつ前のURLを返す
	end

private
    def task_params
    	params.require(:task).permit(:content)
    end
end
