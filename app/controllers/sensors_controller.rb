class SensorsController<ApplicationController
  helper SensorHelper
  before_action do
    @user = User.find(params[:user_id])
  end
  before_action :confirm_current_user

  def current_reading
    @sensor = @user.sensors.all
  end

  def start_sensor
    conn = PG.connect( dbname: 'SolarFlare_development' )

    data = Sensor.new
    loop do
      user = current_user
      level = data.light_level
      sleep 5
      sql = 'insert into sensors (data_point, created_at, user_id) values ($1, $2, $3);'
      conn.exec_params(sql, [level, Time.now.to_s, user.id])
    end
  end


  private

  def confirm_current_user
    unless @user.id == current_user.id
      raise AccessDenied
    end
  end

end
