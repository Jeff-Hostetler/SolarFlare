class User < ActiveRecord::Base

  before_save {|user| user.email=user.email.downcase}

  has_secure_password
  # validates :password, :on => :create
  validates :password, length: {minimum: 6, maximum: 20}, :on => :create
  validates :password_confirmation, presence: true, :on => :create
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :address_state, length: {is: 2}
  # validates :address_zip, length: {is: 5}

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_street_address
    "#{address}, #{address_city}, #{address_state} #{address_zip}"
  end

end
