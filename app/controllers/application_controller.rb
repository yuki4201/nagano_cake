class ApplicationController < ActionController::Base
   # protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path # ログイン後に遷移するpathを設定
    case resource
    when Customer
      public_items_path
    end
    end
  end

  def after_sign_out_path_for(resource)
      new_admin_session_path # ログアウト後に遷移するpathを設定
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
  
end