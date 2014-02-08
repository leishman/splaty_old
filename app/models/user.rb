class User < ActiveRecord::Base
  has_many :notes
  has_many :photos

  validates_uniqueness_of :username, message: "Username has been taken, please try another one"
  validates_uniqueness_of :email, message: "Email has already been used for username"
  validates_presence_of :username, message: "You must enter a username"
  validates_presence_of :email, message: "You must enter an email address"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email is invalid"
end
