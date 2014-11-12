module WeatherHelper

  def weather_now_hash
    forecast = ForecastIO.forecast(37.8267, -122.423, time: Time.now.to_i)
    forecast.to_hash["daily"]
  end

end
