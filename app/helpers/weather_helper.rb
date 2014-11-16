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
    weather_now_hash["cloudCover"]
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
    weather_now_hash["sunriseTime"]
  end

  def sunset_time
    weather_now_hash["sunsetTime"]
  end



  def weather_tomorrow_hash
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 1.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_two_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 2.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_three_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 3.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_four_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 4.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_five_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 5.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_six_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 6.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end

  def weather_in_seven_days
    forecast = ForecastIO.forecast(current_user.latitude, current_user.longitude,
                time: (Time.now + 7.day).to_i)
    daily_data = forecast.to_hash["daily"]
    data_hash = daily_data["data"]
    result_string = data_hash.to_s.chop!
    result_string = result_string[1..-1]
    result_hash = eval(result_string)
  end




end





    # example hash data
    # {"time"=>1415779200, "summary"=>"Light rain overnight.", "icon"=>"rain",
    #   "sunriseTime"=>1415803569, "sunsetTime"=>1415840497, "moonPhase"=>0.7,
    #   "precipIntensity"=>0.0003, "precipIntensityMax"=>0.0022,
    #   "precipIntensityMaxTime"=>1415862000, "precipProbability"=>0.15,
    #   "precipType"=>"rain", "temperatureMin"=>54.9, "temperatureMinTime"=>1415797200,
    #   "temperatureMax"=>65.77, "temperatureMaxTime"=>1415833200,
    #   "apparentTemperatureMin"=>54.9, "apparentTemperatureMinTime"=>1415797200,
    #   "apparentTemperatureMax"=>65.77, "apparentTemperatureMaxTime"=>1415833200,
    #   "dewPoint"=>48.85, "humidity"=>0.68, "windSpeed"=>0.47, "windBearing"=>282,
    #   "visibility"=>9.84, "cloudCover"=>0.77, "pressure"=>1015.96, "ozone"=>261.91}