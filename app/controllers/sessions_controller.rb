class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_path, :notice => "Logged in!"
    else
      flash[:notice] = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Logged out!"
  end
end
