class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
    
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path # ログイン後に遷移するpathを設定
    when User
      users_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      users_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
  end
end