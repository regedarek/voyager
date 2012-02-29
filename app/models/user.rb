class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  acts_as_messageable

  attr_accessible :username, :password, :password_confirmation,
    :email, :remember_me, :authentications_attributes
  validates_confirmation_of :password

  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
end
