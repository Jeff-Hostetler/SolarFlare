class SensorsController<ApplicationController
  helper SensorHelper
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user
  skip_before_action :verify_authenticity_token

  def current_reading
    @sensor = @user.sensors.all
  end

  def create
    @sensor = @user.sensors.new(params.permit(:user_id, :data_point, :created_at))
    unless ("#{@sensor.data_point}".length != 3)
      if @sensor.data_point < 200
        #mailer
        UserMailer.alert_email(@user).deliver
        #twilio
        @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_TOKEN']
        @client.messages.create(
        from: '+17205065738',
        to: @user.phone_number,
        body: 'Light level is too damn low! Love, SolarFlare.'
        )
      end
      @sensor.save
    end
    redirect_to @user
  end

  private

  def confirm_current_user
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

end
