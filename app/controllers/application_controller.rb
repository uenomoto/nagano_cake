class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

#ログイン時のリダイレクト先
def after_sign_in_path_for(resource_or_scope)
  if resource_or_scope.is_a?(Admin)
    flash[:notice]="ログインしました"
    admin_root_path
  else
    flash[:notice]="ログインしました"
    root_path
  end
end

  #ログアウトした時にadminだったら管理者ログイン画面へそうでなければトップへ
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      flash[:notice]="ログアウトしました"
      new_admin_session_path
    else
      flash[:notice]="ご利用ありがとうございました。またお待ちしてます！"
      root_path
    end
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
