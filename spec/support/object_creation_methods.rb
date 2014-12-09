def create_admin
User.create!(
first_name: "Test",
last_name: "Admin",
email: "admin@test.com",
password: "password",
password_confirmation: "password",
admin: true,
)
end

def create_user
  User.create!(
  first_name: "Test",
  last_name: "User",
  email: "test@test.com",
  password: "password",
  password_confirmation: "password",
  )
end

def create_user2
  User.create!(
  first_name: "Test2",
  last_name: "User",
  email: "test2@test.com",
  password: "password",
  password_confirmation: "password",
  )
end

def log_user_in(user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Sign In"
end
