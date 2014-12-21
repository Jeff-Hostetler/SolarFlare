require 'rails_helper'

describe Sensor do
  it "belongs to a user" do
    user = create_user
    sensor = create_sensor(user)

    expect(sensor.user).to eq(user)
  end
end
