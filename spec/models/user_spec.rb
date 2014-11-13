require 'rails_helper'

describe User do

  it "has a unique email" do
    User.create!(
      first_name: "Test",
      last_name: "Test",
      email: "TEST@test.com",
      password: "password",
      password_confirmation: "password"
    )

    user = User.new(email: "test@test.com")
    user.valid?
    expect(user.errors[:email].present?).to eq(true)


    user2 = User.new(email: "test2@test.com")
    user2.valid?
    expect(user2.errors[:email].present?).to eq(false)
  end

  it "has a password between 6 and 20 characters" do
    user = User.new(
      email: "test@test.com",
      password: "1234",
      password_confirmation: "1234")
    user.valid?
    expect(user.errors[:password].present?).to eq(true)

    user = User.new(
      email:"test@test.com",
      password: "123456",
      password_confirmation: "123456")
    user.valid?
    expect(user.errors[:password].present?).to eq(false)

    user = User.new(
      email: "test@test.com",
      password: "123456789012345678901",
      password_confirmation: "123456789012345678901")
    user.valid?
    expect(user.errors[:password].present?).to eq(true)
  end

end
