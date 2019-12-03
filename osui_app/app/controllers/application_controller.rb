class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
# このアクションを追加
  def after_sign_in_path_for(resource)
    #"/user/#{current_user.id}"
    "/home/top"
  end
  
protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private
  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to new_user_mfa_session_path
    end
  end
end
