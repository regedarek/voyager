class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => "It's error with reCAPTCHA!") and @user.save
      redirect_to root_path, :notice => "Signed up!"
    else
      render :new
    end
  end

end
