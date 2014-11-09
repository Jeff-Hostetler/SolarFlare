class User < ActiveRecord::Base
  before_save {|user| user.email=user.email.downcase}

  has_secure_password
  # validates_presence_of :password, :on => :create
  validates :password, length: {minimum: 8, maximum: 20}
  validates_presence_of :password_confirmation, :on => :create, length: {minimum: 8, maximum: 20}
  validates_presence_of :email, presence: true, uniqueness: true
  validates_presence_of :first_name, presence: true
  validates_presence_of :last_name, presence: true

end
