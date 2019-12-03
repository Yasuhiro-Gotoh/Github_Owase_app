# app/controllers/user_mfa_session_controller.rb

class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa

  def new
    @user = current_user
  end

  def create
    @user = current_user # grab your currently logged in @user
    if @user.google_authentic?(params[:mfa_code])
      UserMfaSession.create(@user)
      redirect_to root_path
    else
      flash[:error] = "Wrong code"
      render :new
    end
  end
end