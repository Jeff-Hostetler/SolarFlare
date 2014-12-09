module SensorHelper

  def sensor_average_x_days_ago(x)
    sum = 0
    Sensor.where(created_at: Time.now-(x+1).day..Time.now-x.day).each do |sensor|
      sum += sensor.data_point
    end
    average = sum / Sensor.where(created_at: Time.now-(x+1).day..Time.now-x.day).count
  end

end
