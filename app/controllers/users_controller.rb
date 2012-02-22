class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save && verify_recaptcha(:model => @user, :message => "Oh! It's error with reCAPTCHA!")
      redirect_to root_path, :notice => "Signed up!"
    else
      render :new
    end
  end

end
