class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery
  
  # next, for user and admin controllers put in it filter,
  # and remove from controller visible for guest
  before_filter :require_login
    
  helper_method :current_users_list

  #######################
  protected
  
  def current_users_list
    current_users.map { |u| u.username }.join(", ")
  end
  
  # protected
  def not_authenticated
    redirect_to login_url
  end
end
