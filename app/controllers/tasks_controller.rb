class TasksController < ApplicationController
	def create
		animal = Animal.find(params[:animal_id])#animalのidをとってくる
		task = animal.tasks.new(task_params)
		task.save
		redirect_to request.referer#ひとつ前のURLを返す
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
