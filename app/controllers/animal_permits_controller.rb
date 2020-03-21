class AnimalPermitsController < ApplicationController
  def create
  	current_user.permit(params[:user_id])#modelで定義
    redirect_to request.referer
  end

  def status_change
  	@permit = AnimalPermit.find(params[:user_id])
  	@permit.status = "permit"
  	@permit.save
    redirect_to request.referer, notice: 'パートナーに登録しました！'
  end

  def destroy
  	current_user.unpermit(params[:user_id], params[:flg])#modelで定義
    redirect_to request.referer
  end
end