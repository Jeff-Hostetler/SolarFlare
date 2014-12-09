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
