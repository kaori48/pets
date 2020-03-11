class AnimalPermitsController < ApplicationController
  def create
  	current_user.permit(params[:user_id])#modelで定義
    redirect_to request.referer
  end

  def destroy
  	current_user.unpermit(params[:user_id])#modelで定義
    redirect_to request.referer
  end
end