module SensorHelper

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
      "property_value" => "#{@user.id}",
      maxAge: 300
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
