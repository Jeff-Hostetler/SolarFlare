class User < ActiveRecord::Base
  before_save {|user| user.email=user.email.downcase}

  has_secure_password
  validates_presence_of :password, :on => :create
end
