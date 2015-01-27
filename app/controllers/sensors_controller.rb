class SensorsController<ApplicationController
  helper SensorHelper
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user, only:[:current_reading]
  skip_before_action :verify_authenticity_token
  skip_before_action :confirm_logged_in, only:[:create]

  def current_reading
    respond_to do |format|

      format.html {
        @sensor = @user.sensors.last
      }
      format.json { render json: @user.sensors.last }

    end

  end

  def create
    @sensor = @user.sensors.new(params.permit(:user_id, :data_point, :created_at))
    if data_validation(@sensor)
      if @sensor.data_point < 200
        #mailer
        if (@user.email_alert == true)
          UserMailer.alert_email(@user).deliver
        end
        #twilio
        if (@user.text_alert == true) && (@user.phone_number != nil)
          @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_TOKEN']
          @client.messages.create(
            from: '+17205065738',
            to: @user.phone_number,
            body: 'Light level is too damn low! Love, SolarFlare.'
          )
        end
      end
      Keen.publish(:sensors, {user_id: @user.id,
                              data_point: @sensor.data_point,
                              sensor_id: @sensor.id,
                              created_at: Time.now})
      # saved to Keen
      # @sensor.save
    end
    redirect_to root_path
  end

  private

  def confirm_current_user
    unless (@user.id == current_user.id) || (current_user.admin == true)
      raise AccessDenied
    end
  end

  def data_validation(sensor)
    if (("#{sensor.data_point}".length == 3) &&
        ("08:00" < DateTime.now.strftime("%H:%M")) &&
        ( DateTime.now.strftime("%H:%M") < "20:00"))
      true
    end
  end

end
