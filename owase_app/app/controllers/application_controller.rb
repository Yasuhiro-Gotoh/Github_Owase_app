class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  def set_current_user
      @current_user = User.find_by(name: session[:user_name])
  end
  
  def authenticate_user
     if @current_user == nil
        flash[:notice] = "ログインしてください"
        redirect_to("/")
     end
  end
end
