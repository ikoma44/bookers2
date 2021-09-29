class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
    # ログイン後ホームではなくマイページへ
  end

  #sign_out後のredirect先変更。rootでhome topへ
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    #sign_upの際にnameのデータ操作を許可。追加したカラム。

  end

end
