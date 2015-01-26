module SensorHelper

  def sensor_average_x_days_ago(x)
    sum = 0
    @user.sensors.where(created_at: Time.current-(x+1).day..Time.current-x.day).each do |sensor|
      sum += sensor.data_point
    end
    average = sum / (Sensor.where(created_at: Time.current-(x+1).day..Time.current-x.day).count).to_f
  end

  def sensor_percentage_average_x_days_ago(x)
    sum = 0
    @user.sensors.where(created_at: Time.current-(x+1).day..Time.current-x.day).each do |sensor|
      sum += sensor.data_point
    end
    average = sum / (Sensor.where(created_at: Time.current-(x+1).day..Time.current-x.day).count).to_f
    average / 1000
  end

  def weekly_sensor_data
    data = []
    i = 0
    until i > 7
      data<< [(Time.current-i.day).to_date, sensor_percentage_average_x_days_ago(i)]
      i +=1
    end
    data
  end
  #have to test after getting some data over a couple of days

  def keen_weekly_sensor_data
    data = []
    i = 0
    until i > 7
      data_point = (Keen.average("sensors", :target_property => "data_point",
      :percentile => 90,
      :timeframe => {
        start: "#{Time.now - (i+1).day}",
        end: "#{Time.now - (i).day}"
    },
    :filters => [{
      "property_name" => "user_id",
      "operator" => "eq",
      "property_value" => "#{@user.id}"
      }])).to_f


      if data_point == nil
        data_percentage_point = 0
      else
        data_percentage_point = data_point/1000
      end

      data<< [(Time.current-i.day).to_date, data_percentage_point]
      i += 1
    end

    data
  end
end
