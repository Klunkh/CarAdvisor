class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

 
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Ti abbiamo inviato una email con le istruzioni per reimpostare la password."
      redirect_to root_url
    else
      flash.now[:danger] = "Indirizzo email non trovato."
      render 'new'
    end
  end
  def password_blank?
      params[:user][:password].blank?
    end
  def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  
  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def get_user
      @user = User.find_by(email: params[:email])
    end
  def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

end
