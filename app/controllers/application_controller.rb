class ApplicationController < ActionController::Base
   before_action :authenticate_user!#ユーザー認証

  def after_sign_in_path_for(resource)
    users_mypage_root_path # ログイン後の行先、マイページ
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後の行先
  end
end
