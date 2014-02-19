class User < ActiveRecord::Base
  attr_accessible :username, :email

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
end