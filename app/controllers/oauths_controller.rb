class OauthsController < ApplicationController
  def oauth
  end
  
  def callback
    redirect_to root_path
  end

end
