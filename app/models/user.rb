class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :password, :password_confirmation, :email, :remember_me
  validates_confirmation_of :password

  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  has_many :authentications, :dependent => :destroy
end
