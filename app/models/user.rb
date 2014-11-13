class User < ActiveRecord::Base

  before_save {|user| user.email=user.email.downcase}

  has_secure_password
  # validates_presence_of :password, :on => :create
  validates :password, length: {minimum: 6, maximum: 20}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
