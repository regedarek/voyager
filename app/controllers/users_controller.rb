class UsersController < ApplicationController
  # load_and_authorize_resource
  skip_before_filter :require_login

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes!(params[:user])
      redirect_to edit_user_path(params[:id]), :notice => "Parameters update."
    else
      render :action => 'edit'
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
