require 'date'
module WeatherHelper


  def weather_now_hash
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude, time: Time.now.to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def cloud_cover_now
    cc = weather_now_hash["cloudCover"]
    display_percentage = cc*100
  end

  def precipitation_probability
    weather_now_hash["precipProbability"] * 100
  end

  def weather_summary
    weather_now_hash["summary"]
  end

  def temperature_max
    weather_now_hash["temperatureMax"]
  end

  def temperature_min
    weather_now_hash["temperatureMin"]
  end

  def sunrise_time
    Time.at(weather_now_hash["sunriseTime"]).to_time.to_s(:time)
  end

  def sunset_time
    Time.at(weather_now_hash["sunsetTime"]).to_time.to_s(:time)
  end

  def weather_x_days_ago_hash(x)
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
    time: (Time.now - x.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def past_week_weather_data
    data = []
    i = 0
    until i > 7
      data<< [(Time.now-i.day).to_date, weather_x_days_ago_hash(i)["cloudCover"]]
      i +=1
    end
    data
  end

end
