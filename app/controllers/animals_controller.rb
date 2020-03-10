class AnimalsController < ApplicationController
  def index
  	@animals = Animal.all.order(created_at: :desc)
  end

  def show
  	@animal = Animal.find(params[:id])
  	@comment = AnimalComment.new#コメント機能新規
  	@comments = @animal.animal_comments#コメント一覧
  end

  def new
  	@animal = Animal.new
  end
  def create
  	animal = Animal.new(animal_params)
  	animal.user_id = current_user.id
  	animal.save
  	redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
  end

  def edit
  	@animal = Animal.find(params[:id])
  end

  def update
  	animal = Animal.find(params[:id])
  	animal.update(animal_params)
  	redirect_to action: :show#showへ
  end

  def destroy
  	animal = Animal.find(params[:id])
  	animal.destroy
  	redirect_to user_animal_path(current_user.id)#userのanimalページに飛ぶ
  end
  private
  def animal_params
  	params.require(:animal).permit(:animal_image, :name, :birth, :food, :toilet, :water, :hospital, :other)
  end
end
