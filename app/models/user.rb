class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :password, :password_confirmation, :email
  validates_confirmation_of :password

  # validates_presence_of :username, :email, :password, :password_confirmation
end
