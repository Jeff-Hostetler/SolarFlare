require 'rails_helper'

describe User do

  it "requires first, last, email, password/conf" do
    user = User.new
    user.valid?

    expect(user.errors[:first_name].present?).to eq(true)
    expect(user.errors[:last_name].present?).to eq(true)
    expect(user.errors[:email].present?).to eq(true)
    expect(user.errors[:password].present?).to eq(true)
    expect(user.errors[:password_confirmation].present?).to eq(true)


    user = create_user

      user.valid?

      expect(user.errors[:first_name].present?).to eq(false)
      expect(user.errors[:last_name].present?).to eq(false)
      expect(user.errors[:email].present?).to eq(false)
      expect(user.errors[:password].present?).to eq(false)
      expect(user.errors[:password_confirmation].present?).to eq(false)
  end

  it "has a unique email" do
    user = create_user

    user2 = User.new(email: user.email)
    user2.valid?

    expect(user2.errors[:email].present?).to eq(true)


    user3 = User.new(email: "test2@test.com")
    user3.valid?

    expect(user3.errors[:email].present?).to eq(false)
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

  it "has full_name method" do
    user = User.new(first_name: "First", last_name: "Last")
    expect(user.full_name).to eq("First Last")
  end

  it "has full_street_address method" do
    user = User.new(address: "123 Fake St.",
                    address_city: "City",
                    address_state: "ST",
                    address_zip: "10000" )
    expect(user.full_street_address).to eq ("123 Fake St., City, ST 10000")
  end
  it "has many sensors" do
    user = create_user
    sensor = create_sensor(user)
    sensor2 = create_sensor(user)

    expect(user.sensors.count).to eq(2)
  end
end
