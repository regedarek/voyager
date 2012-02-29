class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_reset_password_instructions! 
      redirect_to root_path, :notice => "Instructions have been sent to your email."
    else
      redirect_to root_path, :notice => 'Instructions have been sent to your email.' #"User not found."
    end
  end
  
  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]
    not_authenticated if !@user
  end

  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if !@user
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      redirect_to root_path, :notice => "Password was successfully updated."
    else
      render :action => "edit"
    end
  end
end
