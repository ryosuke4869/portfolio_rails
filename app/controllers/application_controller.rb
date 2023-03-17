class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時にnameも追加で許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # プロフィール編集時にnameと自己紹介、アイコン画像のストロングパラメーターを渡す設定
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduce, :avatar])
  end
end
