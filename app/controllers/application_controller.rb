class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_users_list

  #protected
  def current_users_list
    current_users.map { |u| u.username }.join(", ")
  end
end
