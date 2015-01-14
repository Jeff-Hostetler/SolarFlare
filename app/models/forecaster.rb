class Forecaster

  attr_reader :data

  def initialize(user, time)
    @user = user
    @time = time
  end

  def get_forecast
    forecast = ForecastIO.forecast(
      @user.latitude,
      @user.longitude,
      time: @time.to_i
    )
    daily_data = forecast.to_hash["daily"]
    @data = daily_data["data"].first
  end

  def cloud_cover
    @data["cloudCover"] * 100
  end

  def precipitation_probability
    @data["precipProbability"] * 100
  end

  def weather_summary
    @data["summary"]
  end

  def temperature_max
    @data["temperatureMax"]
  end

  def temperature_min
    @data["temperatureMin"]
  end

  def sunrise_time
    Time.at(@data["sunriseTime"]).to_time.to_s(:time)
  end

  def sunset_time
    Time.at(@data["sunsetTime"]).to_time.to_s(:time)
  end

  def weather_x_days_ago_hash(x)
    forecast = Forecaster.new(
    @user,
    @time - x.day
    )
    forecast.get_forecast
    forecast.data
  end

  def past_week_cloud_data
    data = []
    i = 0
    until i > 7
      data<< [(@time-i.day).to_date, weather_x_days_ago_hash(i)["cloudCover"]]
      i +=1
    end
    data
  end

  def next_week_cloud_data
    data = []
    i = 0
    until i > 7
      data<< [(@time+i.day).to_date, weather_x_days_ago_hash(-i)["cloudCover"]]
      i +=1
    end
    data
  end

end
