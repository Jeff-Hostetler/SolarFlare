require "rails_helper"

describe UserMailer do
  describe "#alert" do
    it "sends alert email to user when data_point from sensor is below threshold" do
      user = create_user
      sensor = Sensor.create!(
        data_point: 100,
        user_id: user.id
        )
      expect(Sensor.count).to eq(1)
      #expect mailer sent
    end
  end
end
