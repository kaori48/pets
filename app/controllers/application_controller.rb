class ApplicationController < ActionController::Base
   before_action :authenticate_user!#ユーザー認証

  def after_sign_in_path_for(resource)
    users_mypage_path # ログイン後の行先、マイページ
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後の行先
  end
end
