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
  
  def activate
    @user = User.load_from_activation_token(params[:id])
    if @user
      @user.activate!
      redirect_to login_path, :notice => 'User was successfully activated.'
    else
      not_authenticated
    end
  end
end
