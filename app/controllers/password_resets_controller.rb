class PasswordResetsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    @user.deliver_reset_password_instructions! if @user
    redirect_to root_path, :notice => "Instructions have been sent to your email."  
  end
  
  def edit
  end

end
