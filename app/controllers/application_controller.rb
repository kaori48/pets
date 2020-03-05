class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
       users_mypage_path # ログイン後の行先、マイページ
    end

    def after_sign_out_path_for(resource)
       root_path # ログアウト後の行先
    end
 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時でnameのキーの追加を許可する
  end

end